<?php


namespace app\models;

use app\core\App;
use RedBeanPHP\OODBBean;

abstract class AppModel{

    protected static $tableName = '';

    /**
     * @var OODBBean
     */
    protected $bean;
    protected $attributes = [];
    protected $data = [];
    public $id = 0;

    public function __construct($bean = null){
        if ($bean) {
            $this->bean = $bean;
        }else {
            $this->bean = \R::dispense(static::$tableName);
        }
    }

    public function load($data){
        foreach ($this->attributes as $key => $value) {
            if (isset($data[$key])) {
                $this->attributes[$key] = $data[$key];
            }
        }
    }

    public function save(){

        $this->bean->import($this->attributes);
        if ($this->id) {
            $this->bean->id = $this->id;
        }
        $res = \R::store($this->bean);
        if (!$res) {
            return false;
        }
        $this->id = $res;
        return true;
    }

    /**
     * @param $sql
     * @param $params
     * @return static[]
     */
    public static function find($sql, $params = []) {
        $result = [];
        $beans  = \R::find(static::$tableName, $sql, $params);
        foreach ($beans as $bean) {
            $item = new static();
            foreach ($item->attributes as $key => $value) {
                $item->attributes[$key] = $bean->$key;
            }
            $item->id = $bean->id;
            $item->bean = $bean;
            $result[] = $item;
        }
        return $result;
    }

    public function __get($name){
        if (isset($this->attributes[$name])) {
            return    $this->attributes[$name];
        }
        return null;
    }

    public function __set($name, $value){
        if (isset($this->attributes[$name])) {
            $this->attributes[$name] = $value;
        }
    }

    public static function totalCount($params = []){
        if (count($params) > 0) {
            $sql = 'WHERE ';
            $paramsTotal = [];
            $paramsSql = [];
            foreach ($params as $key => $value) {
                $paramsTotal[':' . $key] = $value;
                $paramsSql[] = ':' . $key . '=' . $key;
            }
            $sql .= implode(' AND ',$paramsSql);
            return \R::count(static::$tableName,$sql,$paramsTotal);
        }
        return \R::count(static::$tableName);
    }

    public static function delete($id) {
        $bean = \R::findOne(static::$tableName,'id = ?',[$id]);
        \R::trash($bean);
    }

    /**
     * @param $sql
     * @param $params
     * @return static
     */
    public static function findOneById($id) {
        $bean  = \R::findOne(static::$tableName, 'id = :id', [':id' => $id]);
        $item = new static();
        if ($bean) {
            foreach ($item->attributes as $key => $value) {
                $item->attributes[$key] = $bean->$key;
            }
            $item->id = $bean->id;
            $item->bean = $bean;
        }
        return $item;
    }

}