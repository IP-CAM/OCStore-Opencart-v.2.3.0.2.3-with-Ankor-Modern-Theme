<?php


namespace app\models;
use app\core\App;


/**
 * Class Callback
 * @package app\models
 * @property string firstName
 * @property string phone
 * @property string comment
 * @property string url
 * @property int status
 */
class Callback extends AppModel {
    const STATUS_BEGIN = 0;
    const STATUS_WORK = 1;
    const STATUS_END = 2;

    public $errors = [];

    protected static $tableName = 'callback';
    public $attributes = [
        'firstName' => '',
        'phone' => '',
        'comment' => '',
        'status' => self::STATUS_BEGIN,
        'url' => '',
    ];

    public function validate($data){
        if ((utf8_strlen($data['firstName']) < 1) || (utf8_strlen($data['firstName']) > 250) ) {
            $this->errors['firstName'] = 'Введите имя';
        }
        if ((utf8_strlen($data['phone']) < 3) || (utf8_strlen($data['firstName']) > 32) ) {
            $this->errors['phone'] = 'Введите номер телефона';
        }
        return (count($this->errors) == 0);
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
        $sql = 'ORDER BY status ASC,id DESC LIMIT :start,:count';
        $params = [
            ':start' => $start,
            ':count' => $limit,
        ];
        return self::find($sql, $params);
    }

    /**
     * @return array
     */
    public static function getLabelsStatus(){
        $res = [
            self::STATUS_BEGIN => 'Не начат',
            self::STATUS_WORK => 'В работе',
            self::STATUS_END => 'Завершен'
        ];
        return $res;
    }

    public function getLabelStatus(){
        $statuses  = self::getLabelsStatus();
        return $statuses[$this->status];
    }

}