<?php

namespace app\core;
/**
 * Class DataStore
 */
class DataStore{
    protected $data = [];

    public function __get($name){
        if (!isset($this->data[$name])) {
            return null;
        }
        return $this->data[$name];
    }

    public function __set($name, $value){
        $this->data[$name] = $value;
    }

}