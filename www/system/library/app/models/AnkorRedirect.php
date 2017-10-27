<?php

namespace app\models;


class AnkorRedirect extends AppModel  {

    protected static $tableName = 'ankorredirects';
    protected $attributes = [
        'link' => '',
        'redirect' => ''
    ];

    public function loadFromExcel($data) {

    }

}