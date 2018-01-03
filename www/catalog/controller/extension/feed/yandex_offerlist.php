<?php

use app\libs\ArrayToXML ;
use app\core\App;

class ControllerExtensionFeedYandexOfferlist extends Controller{

    private $productsData;
    private $ymlData ;
    private $categories;

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
        $yandexDataCatogeries = $this->getYandexCategories();
        $yandexDataOffers     = $this->getYandexOffers();
        $yandexDataCurrencies = $this->getYandexCurrencies();

        $yandexData['shop'] = [
            'name'                => App::$config->ymlMarketName,
            'company'             => App::$config->ymlcompanyName,
            'url'                 => App::$config->ymlUrl,
            'currencies'          => ['currency'=>$yandexDataCurrencies],
            'categories'          => ['category'=>$yandexDataCatogeries],
            'local_delivery_cost' => App::$config->delivery,
            'offers'              => ['offer'=>$yandexDataOffers],
        ];

        $this->generateYandexFile($yandexData);
    }

    public function generateYandexFile($yandexData){
        $xml     = new ArrayToXML();
        $this->ymlData = $xml->buildXML($yandexData,'yml_catalog');
        $this->addAttributes();
    }

    public function getYandexCategories(){
        $this->categories = $this->model_catalog_category->getCategories();
        for($i=0; $i<count($this->categories); $i++){
            $yandexDataCategories[$i]    = $this->categories[$i]['name'];
        }
        return $yandexDataCategories;
    }

    public function getServicesId(){
        $servicesId = [];
        foreach ($this->categories as $category){
            if($category['type_products'] == '1'){
                $servicesId [] = $category['category_id'];
            }
        }
        return $servicesId;
    }

    public function getYandexOffers(){
        $productsData = $this->productsData;
        $servicesId = $this->getServicesId();
        $i = 0;
        foreach($productsData as $product){
            $categoryId = $this->model_catalog_product->getProductMainCategoryId($product['product_id']);
            if(in_array($categoryId,$servicesId)){ // услоги
                    continue;
            }
            $url = $this->url->link('product/product',['product_id' => $product['product_id']]);
            $yandexDataOffers[$i]['url']         = $url;
            $yandexDataOffers[$i]['price']       = $product['price'];
            $yandexDataOffers[$i]['picture']     = $product['image'];
            $yandexDataOffers[$i]['description'] = $product['name'];
            $yandexDataOffers[$i]['currencyId']  = 'RUB';
            $yandexDataOffers[$i]['categoryId']  = $categoryId;
            $yandexDataOffers[$i]['delivery']    = 'true';
            $yandexDataOffers[$i]['vendor']      = $product['manufacturer'];
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
        $categories = $this->model_catalog_category->getCategories();
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