<?php


namespace app\models;
use app\core\App;
use app\core\Telegram;

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

    public function sendAlert(){
        $chat = App::$config->chatCalculationOrderTg;
        if (empty($chat)) {
            return;
        }
        $telegram = new Telegram($chat);
        $telegram->sendMessage($this->getTextAlert());
    }

    protected function getTextAlert() {
        $href = $this->url;
        $res = "\xF0\x9F\x94\x96 Новый заказ расчета \n";
        $res .= "<b>Имя:</b>   " . $this->firstName . "\n";
        $res .= "<b>Телефон:</b> " . $this->phone. "\n";
        $res .= "<b>Тип конструкции:</b> " . $this->typeConstruction. "\n";
        $res .= "<b>Размер конструкции:</b> " . $this->sizeConstruction. "\n";
        $res .= "<b>Комментарий:</b> " . $this->comment. "\n";
        $res .= '<a href="' . $href . '">Ссылка</a>' ;
        return $res;
    }
}