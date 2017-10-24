<?php
/**
 * Created by PhpStorm.
 * User: korns
 * Date: 19.10.2017
 * Time: 12:11
 */

namespace app\models;


trait TRegistry {

    protected $_container;

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

}