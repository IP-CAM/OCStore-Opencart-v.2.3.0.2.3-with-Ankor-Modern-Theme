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
 * @property array telegram;
 * @property bool debug;
 * @property int idProductServiceOnMainMenu;
 */
class Config {
    protected $data = [];
    public function __construct(){
        $config = require_once DIR_SYSTEM . 'library/app/config/config.php';
        if (empty($config)) {
            return;
        }
        foreach ($config as $key => $value) {
            $this->data[$key] = $value;
        }
    }
    public  function __get($name){
        return $this->data[$name];
    }
}