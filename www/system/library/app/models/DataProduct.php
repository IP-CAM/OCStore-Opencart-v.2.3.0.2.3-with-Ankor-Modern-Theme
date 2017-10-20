<?php
/**
 * Created by PhpStorm.
 * User: korns
 * Date: 19.10.2017
 * Time: 11:55
 */

namespace app\models;


use app\core\App;
use app\libs\Upload;


class DataProduct implements \ArrayAccess  {
    use TArrayAccess;
    protected static $groupAttributesId = 1;
    public static $productsExcel = [];
    public static $groupsExcel = [];
    /**
     * @var \ModelCatalogProduct
     */
    public static $ocModel;
    /**
     * @var \ModelCatalogManufacturer
     */
    public static $ocModelManufacturer;
    /**
     * @var \ModelCatalogAttribute
     */
    public static $ocModelAttribute;
    /**
     * @var \ModelCatalogOption
     */
    public static $ocModelOption;

    public $id;
    public $name = '';

    protected $langId = 1;

    public function __construct(){

//        $this->langId = (int)self::$ocModel->config->get('config_language_id');
    }

    public function __get($name){
        if (isset($this->_container[$name])) {
            return $this->_container[$name];
        }else {
            return null;
        }
    }

    public function __set($name, $value){
        $this->_container[$name] = $value;
    }

    public function loadFromExcelData($data) {
        $product_description[$this->langId] = [
            'name' => $data[3],
            'description' => $data[7],
            'tag' => '',
            'meta_title' => '',
            'meta_h1' => '',
            'meta_description' => '',
            'meta_keyword' => '',

        ];
        $this->name = $product_description[$this->langId]['name'];
        $this->product_description = $product_description;
        $this->price = $data[9];
        $this->quantity = 0;
        if ($data[16] == '+') {
            $this->quantity = 9999999;
        }
        $this->measure_str = $data[11];
        $this->keyword = $data[0];
        $this->shipping = 1;
        $this->status = 1;
        $this->main_category_id = self::$groupsExcel[$data[18]];
        $this->manufacturer_id = $this->getManufacturer($data[28]);
        $product_store = ['0'];
        $this->product_store = $product_store;
        //идентификатор товара (для поиска разновидностей) в excel
        $this->idProductFromExcel = $data[18];
        $this->nameOptions = explode(',', $data[4]);

        $this->saveImagesExcel($data);
        $this->setAttributes($data);
        $this->setOptions($data);
    }

    protected function saveImagesExcel($data) {

        // TODO save all images
        $images = explode(',', $data[15]);
        if (count($images) == 0) {
            return;
        }
        //file_put_contents(DIR_IMAGE . 'catalog/data/' . basename($images[0]), $images[0]);
        $ch = curl_init($images[0]);
        $fp = fopen(DIR_IMAGE . 'catalog/data/' . basename($images[0]) , 'wb');
        curl_setopt($ch, CURLOPT_FILE, $fp);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_exec($ch);
        curl_close($ch);
        fclose($fp);
        $this->image = 'catalog/data/' . basename($images[0]);
    }

    public function save() {
        if (empty($this->id)) {
            $this->id = self::$ocModel->addProduct($this);
        } else {
            if (self::$ocModel->getProduct($this->id)) {
                self::$ocModel->editProduct($this->id, $this);
            } else {
                $this->id = self::$ocModel->addProduct($this);
            }
        }
    }

    protected function getManufacturer($name) {
        $filter = ['filter_name' => $name];
        $res = self::$ocModelManufacturer->getManufacturers($filter);
        if (empty($res)) {
            return 0;
        }
        return $res[0]['manufacturer_id'];
    }

    protected function setAttributes($data) {
        $product_attribute = [];
        //Страна происхождения
        if (!empty($data[30])) {
            $dataAttribute['attribute_id'] = $this->getIdAttribute('Страна производитель');
            $dataAttribute['product_attribute_description'][$this->langId]['text'] = $data[30];
            $product_attribute[] = $dataAttribute;
        }
        //старт колонки атрибутов
        $startAttr = 34;
        $allCount = count($data);
        $i = $startAttr - 1;
        while ($i <= $allCount - 2) {
            $i++;
            //name
            $name = $data[$i];
            //measure + value
            $i += 2;
            $value = $data[$i];
            if (!empty($data[$i - 1])) {
                $value .= ' ' . $data[$i - 1];
            }
            if (empty($name)) {
                continue;
            }
            $dataAttribute['attribute_id'] = $this->getIdAttribute($name);
            $dataAttribute['product_attribute_description'][$this->langId]['text'] = $value;
            $product_attribute[] = $dataAttribute;
        }
        $this->product_attribute = $product_attribute;
    }

    protected function getIdAttribute($name) {
        $filter = ['filter_name' => $name];
        $res = self::$ocModelAttribute->getAttributes($filter);
        if (empty($res)) {
            $data = [
                'attribute_group_id' => self::$groupAttributesId,
                'sort_order' => '0',
                'attribute_description' => ["{$this->langId}"=> ['name' => $name]],
            ];
            return self::$ocModelAttribute->addAttribute($data);
        }else {
            return $res[0]['attribute_id'];
        }
    }

    protected function setOptions($data) {
        if (count($this->nameOptions) == 0) {
            return;
        }
        $options = [];
        $dataOptions = $this->getDataOptions();
        foreach ($dataOptions as $dataOption) {
            foreach ($dataOption['data'] as $item) {
                foreach ($item as $values) {
                    $name = $values['name'];
                    $value = $values['value'];
                }
            }
        }
//        $this->product_option = $options;
    }

    protected function getDataOptions() {
        $rows = [];
        foreach (self::$productsExcel as $row) {
            if (empty($row[3]) && $row[18] == $this->idProductFromExcel) {
                $rows[] = $row;
            }
        }
        $dataOptions = [];
        foreach ($rows as $row) {
            $res = [];
            $res['image'] = '';
            //старт колонки атрибутов
            $startAttr = 34;
            $allCount = count($row);
            $i = $startAttr - 1;
            $arImages = explode(',',$row[15]);
            if (count($arImages) > 0) {
                $res['image'] = $arImages[0];
            }
            while ($i <= $allCount - 2) {
                $i++;
                $data = [];
                if (in_array($row[$i],$this->nameOptions) ) {

                    $data['name'] = $row[$i];
                    $i += 2;
                    $data['value'] = $row[$i];
                    if (!empty($row[$i - 1])) {
                        $data['value'] .= ' ' . $row[$i - 1];
                    }
                    $res['data'][$data['name']] = $data;
                }
            }
            $dataOptions[] = $res;
        }

        App::$debug->dDie($dataOptions);
    }

}