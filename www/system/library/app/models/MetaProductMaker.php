<?php

namespace app\models;

class MetaProductMaker {
    const TYPE_PRODUCT = 'product';
    const TYPE_SERVICE = 'service';
    protected $title = '';
    protected $nameProduct = '';
    protected $arTitle = [];
    protected $price = '';
    protected $exceptionWords = [];
    public $metaTitle = '';
    public $metaDesc = '';
    protected $typeProduct;
    protected $countWordsTitle = 0;
    protected $countWordsDesc = 0;

    /**
     * @var \Config
     */
    protected $config;

    public static function faktory($title = '', $price = 10, $measure = 'пог.м',$typeProduct = self::TYPE_PRODUCT) {
        $item = new MetaProductMaker();
        $item->title = $title;
        $item->nameProduct = $title;
        $item->price = $price . ' р/' . $measure;
        $item->typeProduct = $typeProduct;
        return $item;
    }

    public function setConfig($config){

        $this->config = $config;

    }

    public function make() {
        $this->arTitle = explode(' ',$this->title);
        $this->initConfig();
        $this->getExceptionWords();
        $this->makeMetaTitle();
        $this->makeMetaDesc();
        return true;
    }

    protected function makeMetaTitle() {
        if ($this->getCountWords() > $this->countWordsTitle) {
            $this->makeTitle($this->countWordsTitle);
        }
        $pattern = $this->getPatternTitle();
        $this->metaTitle = $this->replacePattern($pattern);
    }

    protected function makeTitle($countWords) {
        $count = 0;
        $i = 0;
        $arTitle = [];
        while ($count < $countWords) {
            $arTitle[] = $this->arTitle[$i];
            if (!in_array($this->arTitle[$i],$this->exceptionWords)) {
                $count++;
            }
            $i++;
        }
        $this->title = implode(' ',$arTitle);
    }

    protected function makeMetaDesc() {
        if ($this->getCountWords() > $this->countWordsDesc) {
            $this->makeTitle($this->countWordsDesc);
        }
        $pattern = $this->getPatternDesc();
        $this->metaDesc = $this->replacePattern($pattern);
    }

    protected function initConfig(){
        if ($this->typeProduct == self::TYPE_PRODUCT) {
            $this->countWordsDesc = $this->config->get('config_meta_words_desc_prod_count');
            $this->countWordsTitle = $this->config->get('config_meta_words_title_prod_count');
        }
        if ($this->typeProduct == self::TYPE_SERVICE) {
            $this->countWordsDesc = $this->config->get('config_meta_words_desc_serv_count');
            $this->countWordsTitle = $this->config->get('config_meta_words_title_serv_count');
        }
    }

    protected function getCountWords() {
        $count = 0;

        foreach ($this->arTitle as $word) {
            if (in_array($word,$this->exceptionWords)) {
                continue;
            }
            $count++;
        }
        return $count;
    }


    protected function getExceptionWords() {

        $this->exceptionWords =  explode(',',$this->config->get('config_meta_words_exception_count'));
    }

    protected function replacePattern($pattern) {
        $res = str_replace('{%title%}',$this->title, $pattern);
        $res = str_replace('{%price%}',$this->price, $res);
        return $res;
    }

    protected function getPatternTitle() {
        $pattern = '{%title%}';
        switch ($this->typeProduct) {
            case self::TYPE_PRODUCT:{
                $pattern = $this->config->get('config_meta_pattern_title_prod');
                break;
            }
            case self::TYPE_SERVICE:{
                $pattern = $this->config->get('config_meta_pattern_title_serv');
                break;
            }
        }
        return $pattern;
    }

    protected function getPatternDesc() {
        $pattern = '{%title%}';
        switch ($this->typeProduct) {
            case self::TYPE_PRODUCT:{
                $pattern = $this->config->get('config_meta_pattern_desc_prod');
                break;
            }
            case self::TYPE_SERVICE:{
                $pattern = $this->config->get('config_meta_pattern_desc_serv');
                break;
            }
        }
        return $pattern;
    }

}