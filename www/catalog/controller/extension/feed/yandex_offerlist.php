<?php

use app\libs\ArrayToXML ;
use app\core\App;

class ControllerExtensionFeedYandexOfferlist extends Controller{

    private $productsData;
    private $ymlData ;
    private $categoriesProducts;

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
            'company'             => App::$config->ymlCompanyName,
            'url'                 => App::$config->ymlUrl,
            'currencies'          => ['currency'=>$yandexDataCurrencies],
            'categories'          => ['category'=>$yandexDataCatogeries],
            'local_delivery_cost' => App::$config->ymlDelivery,
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
        $categories = $this->model_catalog_category->getAllCategories();
        foreach ($categories  as $category){
            foreach ($category as $key => $value){
                if (!$this->isProduct($value)) { // услоги
                    continue;
                }
                $this->categoriesProducts[$key] = $value;
                $yandexDataCategories[] = $value['name'];
            }
        }
        return $yandexDataCategories;
    }


    public function getYandexOffers(){
        $productsData = $this->productsData;
        foreach($productsData as $product){
            $categoryId = $this->model_catalog_product->getProductMainCategoryId($product['product_id']);
            if(!isset($this->categoriesProducts[$categoryId])){ // услоги
                    continue;
            }
            $url = $this->url->link('product/product',['product_id' => $product['product_id']]);
            $newOffer = [
                'url' => $url,
                'price'=> $product['price'],
                'picture'=> $product['image'],
                'description'=> $product['name'],
                'currencyId'=> 'RUB',
                'categoryId'=>$categoryId,
                'delivery'=>'true',
                'vendor'=>$product['manufacturer'],
                'model'=>'New'
            ];
            $yandexDataOffers[] = $newOffer ;

        }

        return $yandexDataOffers;
    }

    public function getYandexCurrencies(){
        $curr['@id']= 'RUB';
        $curr['@rate']= 'NBU';
        $currencies[] = $curr ;

        $curr['@id']= 'UAH';
        $curr['@rate']= '1';
        $currencies[] = $curr ;

        $curr['@id']= 'USD';
        $curr['@rate']= 'NBU';
        $currencies[] = $curr ;

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
        foreach($this->categoriesProducts as $category ){
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

    public function isProduct($category){
        if(isset($category['type_products']) && $category['type_products'] == '0' ){
            return true;
        }
        return false;
    }
}

?>