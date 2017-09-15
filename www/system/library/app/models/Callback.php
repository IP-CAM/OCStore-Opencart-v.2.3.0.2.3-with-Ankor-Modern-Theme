<?php


namespace app\models;


/**
 * Class Callback
 * @package app\models
 * @property string firstName
 * @property string phone
 * @property string comment
 * @property string url
 * @property int status
 */
class Callback {
    const STATUS_BEGIN = 0;
    const STATUS_WORK = 1;
    const STATUS_END = 2;

    public $id = 0;
    public $errors = [];

    protected static $tableName = 'callback';
    public $attributes = [
        'firstName' => '',
        'phone' => '',
        'comment' => '',
        'status' => self::STATUS_BEGIN,
        'url' => '',
    ];

    public function load($data){
        foreach ($this->attributes as $key => $value) {
            if (isset($data[$key])) {
                $this->attributes[$key] = $data[$key];
            }
        }
    }

    public function validate($data){
        if ((utf8_strlen($data['firstName']) < 1) || (utf8_strlen($data['firstName']) > 250) ) {
            $this->errors['firstName'] = 'Введите имя';
        }
        if ((utf8_strlen($data['phone']) < 3) || (utf8_strlen($data['firstName']) > 32) ) {
            $this->errors['phone'] = 'Введите номер телефона';
        }
        return (count($this->errors) == 0);
    }

    public function save(){
        $bean = \R::dispense(self::$tableName);
        $bean->import($this->attributes);
        $res = \R::store($bean);
        if (!$res) {
            return false;
        }
        $this->id = $res;
        return true;
    }

    public static function getListAdmin($data){
        $start = 0;
        $limit = 20;
        $results = [];
        if (isset($data['start']) && $data['start']>0) {
            $start = $data['start'];
        }
        if (isset($data['limit']) && $data['limit'] > 1) {
            $limit = $data['limit'];
        }
        $sql = 'ORDER BY id DESC LIMIT :start,:count';
        $params = [
            ':start' => $start,
            ':count' => $limit,
        ];
        return self::find($sql, $params);
    }

    /**
     * @param $sql
     * @param $params
     * @return self[]
     */
    public static function find($sql, $params) {
        $result = [];
        $beans  = \R::find(self::$tableName, $sql, $params);
        foreach ($beans as $bean) {
            $item = new self();
            foreach ($item->attributes as $key => $value) {
                $item->attributes[$key] = $bean->key;
            }
            $result[] = $item;
        }
        return $result;
    }
}