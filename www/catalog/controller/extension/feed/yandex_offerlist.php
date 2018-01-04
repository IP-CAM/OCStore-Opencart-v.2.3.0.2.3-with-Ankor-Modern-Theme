<?php

use app\libs\ArrayToXML ;
use app\core\App;

class ControllerExtensionFeedYandexOfferlist extends Controller{

    private $productsData;
    private $ymlData ;
    private $categoriesIndexedWithId;

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
        $categories = $this->model_catalog_category->getCategories();
        foreach ($categories  as $key => $value){
            $this->categoriesIndexedWithId[$value['category_id']] = $value;
        }


        foreach($this->categoriesIndexedWithId as $category){
            $yandexDataCategories[] = $category['name'];

        }
        return $yandexDataCategories;
    }


    public function getYandexOffers(){
        $productsData = $this->productsData;
        $i = 0;
        foreach($productsData as $product){
            $categoryId = $this->model_catalog_product->getProductMainCategoryId($product['product_id']);
            if( isset($this->categoriesIndexedWithId[$categoryId]['type_products'])&& $this->categoriesIndexedWithId[$categoryId]['type_products'] == '1'){ // услоги
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
        $i = 0; // counter for items in 'category' tag.
        foreach($this->categoriesIndexedWithId as $category ){
            $id = $dom->createAttribute('id');
            $id->value = $category['category_id'];
            $root->getElementsByTagName('category')->item($i)->appendChild($id);

            if($category['parent_id'] != 0){
                $parentId = $dom->createAttribute('parentId');
                $parentId->value = $category['parent_id'];
                $root->getElementsByTagName('category')->item($i)->appendChild($parentId);
            }

            $i++;
        }

        $this->ymlData = $dom->saveXML();
    }


}

?>