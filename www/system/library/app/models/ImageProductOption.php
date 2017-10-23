<?php

namespace app\models;


/**
 * Class ImageProductOption
 * @package app\models
 * @property integer product_id
 * @property integer option_id
 * @property integer option_value_id
 * @property string src
 * @property integer sort
 */
class ImageProductOption extends AppModel {

    protected static $tableName = 'artproductoptionimages';
    protected $attributes = [
        'product_id' => 0,
        'option_id' => 0,
        'option_value_id' => 0,
        'src' => '',
        'sort' => 0,
    ];


    /**
     * @param $productId
     * @return ImageProductOption[]
     */
    public static function findForProduct($productId) {
        $sql = 'WHERE product_id=:product_id ORDER BY sort';
        $params = [
            ':product_id' => $productId,
        ];
        $results = self::find($sql, $params);
        return $results;
    }

    /**
     * @param $productId
     */
    public static function clearForProduct($productId) {
        $items = self::findForProduct($productId);
        foreach ($items as $item) {
            self::delete($item->id);
        }
    }

}