<?php


namespace app\models;

use app\core\App;

abstract class AppModel{

    protected static $tableName = '';
    protected $attributes = [];
    public $id = 0;

    public function load($data){
        foreach ($this->attributes as $key => $value) {
            if (isset($data[$key])) {
                $this->attributes[$key] = $data[$key];
            }
        }
    }

    public function save(){
        $bean = \R::dispense(static::$tableName);
        $bean->import($this->attributes);
        if ($this->id) {
            $bean->id = $this->id;
        }
        $res = \R::store($bean);
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
    public static function find($sql, $params) {
        $result = [];
        $beans  = \R::find(static::$tableName, $sql, $params);
        foreach ($beans as $bean) {
            $item = new static();
            foreach ($item->attributes as $key => $value) {
                $item->attributes[$key] = $bean->$key;
            }

            $item->id = $bean->id;
            $result[] = $item;
        }
        return $result;
    }

    public function __get($name){
        return $this->attributes[$name];
    }

    public function __set($name, $value){
        if (isset($this->attributes[$name])) {
            $this->attributes[$name] = $value;
        }
    }

    public static function totalCount(){
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
        foreach ($item->attributes as $key => $value) {
            $item->attributes[$key] = $bean->$key;
        }
        $item->id = $bean->id;
        return $item;
    }

}