<?php

use app\libs\ArrayToXML ;

class ControllerExtensionFeedYandexOfferlist extends Controller{

    private $productsData;
    private $ymlData ;

    public function index(){

        $this->load->model('catalog/product');
        $this->load->model('catalog/category');
        $this->load->model('catalog/manufacturer');
        $this->productsData = $this->model_catalog_product->getProducts();
        $this->updateYandexOffersList();

        $this->response->addHeader('Content-Type: application/xml');
        $this->response->setOutput($this->ymlData);// here goes the xml output.
    }

    public function updateYandexOffersList(){
        $yandexData           = [];
        $yandexDataOffers     = $this->getYandexOffers();
        $yandexDataCatogeries = $this->getYandexCategories();
        $yandexDataCurrencies = $this->getYandexCurrencies();

        $yandexData['shop'] = [
            'name'             =>'Ankor',
            'company'          =>'Ankor Artorg',
            'url'              =>'http://www.ankor.artorg.com.ua/',
            'currencies'       =>['currency'=>$yandexDataCurrencies],
            'categories'       =>['category'=>$yandexDataCatogeries],
            'local_delivery_cost' => '300',
            'offers'           =>['offer'=>$yandexDataOffers],
        ];

        $this->generateYandexFile($yandexData);
    }

    public function generateYandexFile($yandexData){
        $xml     = new ArrayToXML();
        $this->ymlData = $xml->buildXML($yandexData,'yml_catalog');
        $this->addAttributes();
    }

    public function getYandexCategories(){
        $categories = $data['categories'] = $this->model_catalog_category->getCategories();
        for($i=0; $i<count($categories); $i++){
            $yandexDataCategories[$i]    = $categories[$i]['name'];
        }
        return $yandexDataCategories;
    }

    public function getYandexOffers(){
        $productsData = $this->productsData;
        $i = 0;
        foreach($productsData as $product){
            $category = $this->model_catalog_product->getProductCategories($product['product_id']);
            if($category == '92'  || $product['product_id'] == '83'){
                continue;
            }
            $vendor   = $this->model_catalog_manufacturer->getManufacturer($product['manufacturer_id']);
            $yandexDataOffers[$i]['url']         = 'http://ankor.artorg.com.ua/index.php?route=product/product&product_id='.$product['product_id'];
            $yandexDataOffers[$i]['price']       = $product['price'];
            $yandexDataOffers[$i]['description'] = $product['name'];
            $yandexDataOffers[$i]['currencyId']  = 'RUB';
            $yandexDataOffers[$i]['categoryId']  = $category;
            $yandexDataOffers[$i]['delivery']    = 'true';
            $yandexDataOffers[$i]['vendor']      = isset($vendor['name']) ? $vendor['name'] : "";
            $yandexDataOffers[$i]['model']       = 'New';

            $i++;
        }

        return $yandexDataOffers;
    }

    public function getYandexCurrencies(){
        $currencies[0]['@id']   ='UAH';
        $currencies[0]['@rate'] ='1';
        $currencies[1]['@id']   ='RUB';
        $currencies[1]['@rate'] ='NBU';
        $currencies[2]['@id']   ='USD';
        $currencies[2]['@rate'] ='NBU';

        return $currencies;
    }

    public function addAttributes (){
        $dom = new DOMDocument();
        $dom->loadXML($this->ymlData);
        $root = $dom->documentElement;
        // add date attribute to the yml_catalog tag :
        $date = $dom->createAttribute('date');
        $date->value = date("Y-m-d H:i");
        $root->appendChild($date);

        // add id attributes to categories :
        $categories = $categories = $data['categories'] = $this->model_catalog_category->getCategories();
        for($i=0; $i<count($categories); $i++ ){
            $id = $dom->createAttribute('id');
            $id->value = $categories[$i]['category_id'];
            $root->getElementsByTagName('category')->item($i)->appendChild($id);

            if($categories[$i]['parent_id'] != 0){
                $parentId = $dom->createAttribute('parentId');
                $parentId->value = $categories[$i]['parent_id'];
                $root->getElementsByTagName('category')->item($i)->appendChild($parentId);
            }
        }

        $this->ymlData = $dom->saveXML();
    }


}

?>