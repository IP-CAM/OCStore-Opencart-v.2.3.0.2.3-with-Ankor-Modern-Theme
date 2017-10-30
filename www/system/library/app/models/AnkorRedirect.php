<?php

namespace app\models;


class AnkorRedirect extends AppModel  {

    protected static $tableName = 'ankorredirects';
    public $attributes = [
        'link' => '',
        'redirect' => ''
    ];

    public function loadFromExcel($data) {

    }

    public static function getList() {
        return self::find('');
    }


}