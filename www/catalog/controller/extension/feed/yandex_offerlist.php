<?php

use app\libs\ArrayToXML ;
use app\core\App;

class ControllerExtensionFeedYandexOfferlist extends Controller{

    private $productsData;
    private $categoriesProducts;
    private $ymlData ;

    public function index(){
        $this->load->model('catalog/product');
        $this->load->model('catalog/category');

        $this->getYmlData();

        $this->response->addHeader('Content-Type: application/xml');
        $this->response->setOutput($this->ymlData);// here goes the xml output.
    }

// cache :
    public function getYmlData() {
        $this->ymlData = $this->cache->get('ymlData');

        if(!$this->ymlData) {
            $this->updateYandexOffersList();
            $this->cache->set('ymlData', $this->ymlData);
        }

    }

    public function deleteYmlCache(){
        $this->cache->delete('ymlData');
        $this->response->redirect($this->url->link('extension/feed/yandex_offerlist'));
    }


// generate xml file :
    public function updateYandexOffersList(){
        $yandexData           = [];
        $this->getDataProducts();
        $this->getCategoriesProducts();
        $yandexDataCatogeries = $this->formatYandexCategories();
        $yandexDataOffers     = $this->formatYandexOffers();
        $yandexDataCurrencies = $this->formatYandexCurrencies();

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


// get products and categories from DB :

    public function getDataProducts(){
        $this->productsData = $this->model_catalog_product->getProducts();

        foreach ($this->productsData as $product){
            $categoryId = $this->model_catalog_product->getProductMainCategoryId($product['product_id']);
            $product['category_id'] = $categoryId;
            $products[] = $product  ;
        }

        $this->productsData = $products;
    }

    public function getDataCategories(){
        return $this->model_catalog_category->getAllCategories();
    }


// format data for yandex yml file :

    public function formatYandexOffers(){
        foreach($this->productsData as $product){
            if(!isset($this->categoriesProducts[$product['category_id']])){ // услоги
                continue;
            }
            $url = $this->url->link('product/product',['product_id' => $product['product_id']]);
            $newOffer = [
                'name'=>$product['name'],
                'url' => $url,
                'price'=> $product['price'],
                'picture'=> $product['image'],
                'description'=> $product['name'],
                'currencyId'=> 'RUB',
                'categoryId'=>$product['category_id'],
                'delivery'=>'true',
                'vendor'=>$product['manufacturer'],
                'model'=>'New'
            ];
            $yandexDataOffers[] = $newOffer ;
        }

        return $yandexDataOffers;
    }

    public function formatYandexCurrencies(){
        $curr['@id']= 'RUB';
        $curr['@rate']= '1'; // Центральный банк Российской Федерации
        $currencies[] = $curr ;

        return $currencies;
    }

    public function getCategoriesProducts(){
        $categories = $this->getDataCategories();
            foreach ($categories as $category) {
                foreach ($category as $key => $value){
                        if (!$this->isProduct($value)) { // услоги
                            continue;
                        }
                            $this->categoriesProducts[$key] = $value;
                }
            }
    }

    public function formatYandexCategories (){
        foreach ( $this->categoriesProducts as $key => $value){
            $yandexDataCategories[] = $value['name'];
        }
        return $yandexDataCategories;
    }


// check if product
    public function isProduct($category){
        if(isset($category['type_products']) && $category['type_products'] == '0' ){
            return true;
        }
        return false;
    }

}

?>