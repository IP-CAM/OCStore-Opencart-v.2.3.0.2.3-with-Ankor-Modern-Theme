<?php


namespace app\models;


class CalculatingOrder extends Callback  {

    protected $attributes =[
        'firstName' => '',
        'phone' => '',
        'typeConstruction' => '',
        'sizeConstruction' => '',
        'comment' => '',
        'status' => self::STATUS_BEGIN,
    ];

}