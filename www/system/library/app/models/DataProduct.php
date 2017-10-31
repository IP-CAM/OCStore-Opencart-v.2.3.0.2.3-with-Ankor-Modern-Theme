<?php

namespace app\models;


use app\core\App;
use app\libs\Upload;


/**
 * Class DataProduct
 * @package app\models
 */
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

    /**
     * @var \Controller
     */
    public static $ocRegistry;

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

    public function loadFromExcelData($data, $onlyPropertyProduct = false) {
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
        if (trim($data[16]) === '+') {
            $this->quantity = 9999999;
        }
        $this->measure_str = $data[11];
        $this->keyword = str_replace('р','p',$data[0]);
        $this->shipping = 1;
        $this->status = 1;
        $this->main_category_id = self::$groupsExcel[$data[18]];
        $this->manufacturer_id = $this->getManufacturer($data[28]);
        $product_store = ['0'];
        $this->product_store = $product_store;
        //идентификатор товара (для поиска разновидностей) в excel
        $this->idProductFromExcel = $data[32];
        $this->nameOptions = explode(',', $data[4]);

        if ($onlyPropertyProduct) {
            $this->offersUrls = $this->getUrls();
        } else {
            $this->saveImagesExcel($data);
            $this->setAttributes($data);
            $this->setOptions($data);
        }
    }

    protected function saveImagesExcel($data) {
        $images = explode(',', $data[15]);
        if (count($images) == 0) {
            return;
        }
        $this->image = $this->saveImage($images[0]);
        // additional images
        $saveImages = [];
        foreach ($images as $key=>$image) {
            if ($key == 0) {
                continue;
            }
            $saveImages[] = [
                'image' => $this->saveImage($image),
                'sort_order' => 0,
            ];
        }
        if (!empty($saveImages)) {
            $this->product_image = $saveImages;
        }
    }



    public function saveImage($path, $rewrite = false) {
        $folder =  'catalog/data/download/';
        $path = trim($path);
//        $filename = md5(basename($path)) . '.' . pathinfo($path, PATHINFO_EXTENSION);
        $filename = basename($path);
        if (!$rewrite) {
            if (file_exists(DIR_IMAGE . $folder . $filename)) {
                return $folder . $filename;
            }
        }

        $ch = curl_init($path);
        $fp = fopen(DIR_IMAGE . $folder . $filename , 'wb');
        curl_setopt($ch, CURLOPT_FILE, $fp);
        curl_setopt($ch, CURLOPT_HEADER, 0);
        curl_exec($ch);
        curl_close($ch);
        fclose($fp);
        $image = $folder . $filename;

        return $image;
    }

    public function saveImage2($path) {
        $folder =  'catalog/data/download/';
//        $filename = md5(basename($path)) . '.' . pathinfo($path, PATHINFO_EXTENSION);
        $filename = md5($path) . '.jpg';
        if (is_file(DIR_IMAGE . $folder . $filename)) {
            return $folder . $filename;
        }
        $img = file_get_contents($path);
        file_put_contents(DIR_IMAGE . $folder . $filename, $img);
        return $folder . $filename;
    }

    public function saveImage3($path) {
        $folder =  'catalog/data/download/';
        //copy(urlencode($path), DIR_IMAGE . $folder . basename($path));
//        file_put_contents(DIR_IMAGE . $folder . basename($path), file_get_contents($path));
//        $filename = md5(basename($path)) . '.' . pathinfo($path, PATHINFO_EXTENSION);
        $filename = basename($path);
        $this->save_image($path, DIR_IMAGE .  $folder . $filename);
        return $folder . $filename;


    }

    protected function save_image($img,$path){
        $curl = curl_init($img);
        curl_setopt($curl, CURLOPT_HEADER, 0);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, 1);
        curl_setopt($curl, CURLOPT_BINARYTRANSFER,1);
        $content = curl_exec($curl);
        curl_close($curl);
        if (file_exists($path)) :
            unlink($path);
        endif;
        $fp = fopen($path,'x');
        fwrite($fp, $content);
        fclose($fp);
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
        foreach ($dataOptions as $nameOption=>$dataOption) {
            $findOption = $this->getOptionByName($nameOption);
            $option = [
                'option_id' => $findOption['option_id'],
                'product_option_id' => '',
                'type' => $findOption['type'],
                'sort_order' => $findOption['sort_order'],
                'language_id' => $this->langId,
                'name' => $nameOption,
                'required' => '0',
                ];
            foreach ($dataOption as $item) {
                $option['product_option_value'][] = $this->getDataOptionValue($option, $item);
            }
            $options[] = $option;
        }
        $this->product_option = $options;
    }

    protected function getRowsOffers() {
        $rows = [];
        foreach (self::$productsExcel as $row) {
            if (empty($row[3]) && $row[32] == $this->idProductFromExcel) {
                $rows[] = $row;
            }
        }
        return $rows;
    }

    protected function getDataOptions() {
        $rows = $this->getRowsOffers();
        $dataOptions = [];
        $res = [];
        foreach ($rows as $row) {

            //старт колонки атрибутов
            $startAttr = 34;
            $allCount = count($row);
            $i = $startAttr - 1;
            $arImages = explode(',',$row[15]);
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
                    $itemRes = [
                        'value' => $data['value'],
                        'images' => $arImages,
                    ];
                    if (array_search($row[$i],$this->nameOptions) === 0) {
                        $itemRes['price'] = $row[9];
                    }
                    $res[$data['name']][] = $itemRes
                    ;
                }
            }
        }
        return $res;
    }

    protected function getOptionByName($name) {

        $filter = ['filter_name' => $name];
        $result = self::$ocModelOption->getOptions($filter);
        if (empty($result)) {
            $data =  [
                'option_id' => '',
                'type' => 'radio',
                'sort_order' => 0,
                'option_description' => [$this->langId => ['name'=> $name]]
            ];
            $data['option_id'] =  self::$ocModelOption->addOption($data);
            return $data;
        }
        $result = $result[0];
        return $result;
    }

    protected function getDataOptionValue($option, $itemOptValue) {
        $value = $itemOptValue['value'];
        $findOptionVal = $this->getOptionValueByName($option['option_id'],$value);
        $price = 0;
        if (isset($item['price'])) {
            $price = $item['price'] - $this->price;
        }
        $images = [];
        foreach ($itemOptValue['images'] as $image) {
            $images[] = $this->saveImage($image);
        }
        $optionVal = [
            'product_option_value_id' => '',
            'option_value_id' => $findOptionVal['option_value_id'],
            'quantity' => '999',
            'subtract' => '',
            'price' => $price,
            'price_prefix' => '+',
            'points' => '',
            'points_prefix' => '+',
            'weight' => '',
            'weight_prefix' => '+',
            'imagesFromExcel' => $images,
        ];

        return $optionVal;
    }

    protected function getOptionValueByName($optionId,$name) {

        $resultQuery = self::$ocModelOption->getOptionValues($optionId);
        foreach ($resultQuery as $item) {
            if ($item['name'] === $name) {
                return $item;
            }
        }
        $newData = [
            'image' => '',
            'sort_order' => 0,
            'name' => $name,
        ];
        $new['option_value_id'] = $this->saveOptionValue($optionId,$newData);
        return $new;
    }

    protected function saveOptionValue($option_id, $option_value) {

            App::$db->query("INSERT INTO " . DB_PREFIX . "option_value SET option_id = '" . (int)$option_id . "', image = '" . App::$db->escape(html_entity_decode($option_value['image'], ENT_QUOTES, 'UTF-8')) . "', sort_order = '" . (int)$option_value['sort_order'] . "'");

            $option_value_id = App::$db->getLastId();

                App::$db->query("INSERT INTO " . DB_PREFIX . "option_value_description SET option_value_id = '" . (int)$option_value_id . "', language_id = '" . (int)$this->langId . "', option_id = '" . (int)$option_id . "', name = '" . App::$db->escape($option_value['name']) . "'");

        return $option_value_id;
    }

    protected function getUrls() {
        $rows = $this->getRowsOffers();
        $res = [];
        foreach ($rows as $row) {
            $res[] = str_replace('р','p',$row[0]);
        }
        return $res;
    }

}
