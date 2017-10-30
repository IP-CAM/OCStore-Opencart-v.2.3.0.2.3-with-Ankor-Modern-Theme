<?php
use app\core\App;
use app\models\AnkorRedirect;
use app\models\Callback;
use app\models\DataProduct;

/**
 * Class ControllerCatalogPrides
 */
class ControllerCatalogLoadFromExcel extends Controller {
    const NAME_LIST_PRODUCTS = 'Export Products Sheet';
    const NAME_LIST_GROUPS = 'Export Groups Sheet';
	private $error = array();
    public $data = [];

	public function index() {
        if (isset($this->request->post['do_load_from_excel']) && $this->request->post['do_load_from_excel'] == 'y') {
            ini_set('max_execution_time', 0);
            ini_set('allow_url_fopen', 1);
            set_time_limit(0);
            $this->loadModels();
            $onlyImages = false;
            $onlyLinks = false;
            if (isset($this->request->post['do_image'])) {
                $onlyImages = true;
            }
            if (isset($this->request->post['do_redirects'])) {
                $onlyLinks = true;
            }
            $this->session->data['do_load_from_excel']['success'] = $this->loadFromFile(DIR_UPLOAD . '/' . $this->request->post['nameFile'],$onlyImages,$onlyLinks);
            $this->response->redirect($this->url->link('catalog/load_from_excel', ['token' => $this->session->data['token']]));
        }
        $this->data['nameFile'] = '1.xlsx';
        $this->data['startRow'] = 0;
        $this->data['endRow'] = 9999;

        $this->setOutput();

    }

    protected function loadModels() {
        $this->load->model('catalog/product');
        $this->load->model('catalog/manufacturer');
        $this->load->model('catalog/attribute');
        $this->load->model('catalog/option');

        DataProduct::$ocModel = $this->model_catalog_product;
        DataProduct::$ocModelManufacturer = $this->model_catalog_manufacturer;
        DataProduct::$ocModelAttribute = $this->model_catalog_attribute;
        DataProduct::$ocModelOption = $this->model_catalog_option;

    }

    protected function setOutput() {

        $this->data['error_warning'] = '';
        $this->data['success'] = '';
        if (isset($this->session->data['do_load_from_excel'])) {
            if ($this->session->data['do_load_from_excel']['success']) {
                $this->data['success'] = 'Файл прочитан';
            } else {
                $this->data['error_warning'] = 'Ошибка чтения файла';
            }
            unset($this->session->data['do_load_from_excel']);
        }

        $this->data['title'] = 'Загрузка товаров с Excel';

        $this->document->setTitle($this->data['title']);
        $this->data['header'] = $this->load->controller('common/header');
        $this->data['column_left'] = $this->load->controller('common/column_left');
        $this->data['footer'] = $this->load->controller('common/footer');

        $this->response->setOutput($this->load->view('catalog/load_from_excel', $this->data));
    }

	protected function readFile($excelFile) {

        $objReader = PHPExcel_IOFactory::createReader('Excel2007');
        $objPHPExcel = $objReader->load($excelFile);
        $arrayData = [];
        $arrayData['products'] = [];
        $arrayData['groups'] = [];
        foreach ($objPHPExcel->getWorksheetIterator() as $worksheet) {
            $title = $worksheet->getTitle();
            if ($title == self::NAME_LIST_PRODUCTS) {
                $arrayData['products'] = $worksheet->toArray();
            } elseif ($title == self::NAME_LIST_GROUPS) {
                $arrayData['groups'] = $worksheet->toArray();
            } else {
                $arrayData[$title] = $worksheet->toArray();
            }
        }
        return $arrayData;
    }

    protected function loadFromFile($file, $onlyImages = false,$onlyLinks = false) {
        $excel = $this->readFile($file);
        unset($excel['products'][0]);
        $groups = [];
        foreach ($excel['groups'] as $group) {
            $groups[$group[0]] = $group[7];
        }
        DataProduct::$groupsExcel = $groups;
        if ($onlyImages) {
            $this->saveImages($excel['products']);
            return true;
        }
        if ($onlyLinks) {
            $this->saveRedirects($excel['products']);
            return true;
        }
        $this->saveProducts($excel['products']);
        return true;
    }

    protected function saveProducts($dataProducts) {
        DataProduct::$productsExcel = $dataProducts;
        $cache = new \Cache\File(12 * 31 * 24 * 3600);
        $savedProducts = $cache->get('savedProductsFromExcel');
        $i = 1;
        foreach ($dataProducts as $dataProduct) {
            $i++;
            if ($this->request->post['startRow'] > $i) {
                continue;
            }
            if ($this->request->post['endRow'] <= $i) {
                break;
            }
            if (empty($dataProduct[3])) {
                continue;
            }

            $product = new DataProduct();
            $product->loadFromExcelData($dataProduct);
            if (isset($savedProducts[$product->name])) {
                $product->id = $savedProducts[$product->name];
            }
            $product->save();
            $savedProducts[$product->name] = $product->id;
            $cache->set('savedProductsFromExcel', $savedProducts);
        }
    }

    protected function saveImages($dataProducts) {
        $this->data['loadImgError'] = [];
        $this->data['loadImgSucces'] = [];
        $images = [];
        foreach ($dataProducts as $dataProduct) {
            $rowImages = explode(',',$dataProduct[15]);
            foreach ($rowImages as $rowImage) {
                $images[] = $rowImage;
            }
        }
        $product = new DataProduct();
        $i = 0;
        foreach ($images as $image) {
            $i++;
            $this->saveImageRecursive($product, $image,$i);
        }
    }

    protected function saveRedirects($dataProducts) {
        DataProduct::$productsExcel = $dataProducts;
        $i = 1;
        foreach ($dataProducts as $dataProduct) {
            $i++;
            if ($this->request->post['startRow'] > $i) {
                continue;
            }
            if ($this->request->post['endRow'] <= $i) {
                break;
            }
            if (empty($dataProduct[3])) {
                continue;
            }

            $product = new DataProduct();
            $product->loadFromExcelData($dataProduct,true);
            foreach ($product->offersUrls as $url) {
                $newRedirect = AnkorRedirect::findOne(['link' => $url]);
                $newRedirect->link = $url;
                $newRedirect->redirect = $product->keyword;
                $newRedirect->save();
            }

        }
    }

    protected function saveImageRecursive(DataProduct $product,$image,$i,$trying = 0 ){
        $res = $product->saveImage($image);
        $trying++;
        if (!$this->getResultSaveImage($res,$image, $i)) {
            unlink(DIR_IMAGE . $res);
        }
    }

    protected function getResultSaveImage($res,$image, $i) {
        $size = getimagesize(DIR_IMAGE . $res);
        if (!$size) {
            $this->data['loadImgError'][$i] = ['link' => $image, 'load_file' => $res];
            return false;
        } else {
            $this->data['loadImgSucces'][$i] = ['link' => $image, 'load_file' => $res];
            return true;
        }
    }
}
?>