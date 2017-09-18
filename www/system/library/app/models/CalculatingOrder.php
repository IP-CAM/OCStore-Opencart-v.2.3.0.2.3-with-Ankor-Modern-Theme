<?php


namespace app\models;

/**
 * Class CalculatingOrder
 * @package app\models
 * @property string firstName
 * @property string phone
 * @property string comment
 * @property string url
 * @property int status
 * @property int typeConstruction
 * @property int sizeConstruction
 */
class CalculatingOrder extends Callback  {
    protected static $tableName = 'calculatingorder';
    public $attributes =[
        'firstName' => '',
        'phone' => '',
        'typeConstruction' => '',
        'sizeConstruction' => '',
        'comment' => '',
        'url' => '',
        'status' => self::STATUS_BEGIN,
    ];

}