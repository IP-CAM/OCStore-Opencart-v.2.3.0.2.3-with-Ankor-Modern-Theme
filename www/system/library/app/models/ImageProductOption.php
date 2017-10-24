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
    /**
     * @var \ModelToolImage
     */
    protected static $modelImageTool;
    public $thumbs = [];
    protected $attributes = [
        'product_id' => 0,
        'option_id' => 0,
        'option_value_id' => 0,
        'src' => '',
        'sort' => 0,
    ];

    /**
     * @param $productId
     * @param null $optionId
     * @param null $optionValueId
     * @return ImageProductOption[]
     */
    public static function findForProduct($productId, $optionId = null, $optionValueId = null) {
        $params = [
            ':product_id' => $productId,
        ];
        if ($optionId === null && $optionValueId === null) {
            $sql = 'WHERE product_id=:product_id ORDER BY sort';
        }else {
            $sql = 'WHERE product_id=:product_id AND option_id = :optionId ';
            if ($optionValueId !== null) {
                $sql .= 'AND option_value_id = :optionValueId ';
            }
            $sql .= 'ORDER BY sort';
            $params[':optionId'] = $optionId;
            $params[':optionValueId'] = $optionValueId;
        }
        return self::find($sql, $params);
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

    public static function setModelImageTool(\Controller $controller) {
        if (self::$modelImageTool == null) {
            $controller->load->model('tool/image');
            self::$modelImageTool = $controller->model_tool_image;
        }
    }

    public function setResize($width, $height) {
        if (self::$modelImageTool == null) {
            return;
        }
        $this->thumbs[$width . '_' . $height] = self::$modelImageTool->resize($this->src,$width,$height);
    }

    public function getResize($width, $height) {
        if (self::$modelImageTool == null) {
            return null;
        }
        $key = $width . '_' . $height;
        if (isset($this->thumbs[$key])) {
            return $this->thumbs[$key];
        }
        $this->setResize($width, $height);
        return $this->thumbs[$key];
    }

}