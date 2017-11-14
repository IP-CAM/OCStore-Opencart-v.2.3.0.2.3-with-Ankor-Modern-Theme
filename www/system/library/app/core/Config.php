<?php
/**
 * Created by PhpStorm.
 * User: korns
 * Date: 19.09.2017
 * Time: 11:59
 */

namespace app\core;


/**
 * Class Config
 * @property bool debug;
 * @property int idProductServiceOnMainMenu;
 * @property string idProductServiceOnMainMenuTypeUtp;
 * @property string chatCalculationOrderTg;
 * @property string tokenTelegram;
 * @property string chatCallBackTg;
 * @property string lenghtRelatedListNewsTitle;
 * @property string lenghtRelatedListNewsDesc;
 */
class Config {
    protected $data = [];
    protected $ocPrefix = 'config_art_';
    public function __construct(){
        // настройки файла приоритетнее
        $config = require_once DIR_SYSTEM . 'library/app/config/config.php';
        if (empty($config)) {
            return;
        }
        foreach ($config as $key => $value) {
            $this->data[$key] = $value;
        }
    }
    public  function __get($name){
        if (isset($this->data[$name])) {
            return $this->data[$name];
        } else {
            $ocConfig = App::$registry->get('config')->getData();
            foreach ($ocConfig as $key=>$item) {
                if ($key === $this->ocPrefix . $name) {
                    return $item;
                }
            }
        }
        return null;
    }
}