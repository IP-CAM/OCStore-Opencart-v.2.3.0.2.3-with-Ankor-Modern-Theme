<?php

namespace app\models;


use app\libs\Upload;
use R;

/**
 * Class Photowork
 * @package app\models
 * @property string title
 * @property string image
 * @property string description
 * @property string metaTitle
 * @property string metaDescription
 * @property string nameImage
 * @property int sortImage
 * @property int status
 * @property int sort
 * @property array files
 */
class Photowork extends AppModel {
    const STATUS_OFF = 0;
    const STATUS_ON = 1;

    protected static $tableName = 'artphotoworks';
    protected $attributes = [
        'title' => '',
        'metaTitle' => '',
        'metaDescription' => '',
        'description'=> '',
        'status' => self::STATUS_OFF,
        'image' => '',
        'sortImage' => 100,
        'nameImage'=> '',
        'sort'=> 0
    ];
    public $images = [];

    public static function getListAdmin($data){
        $start = 0;
        $limit = 100;
        if (isset($data['start']) && $data['start']>0) {
            $start = $data['start'];
        }
        if (isset($data['limit']) && $data['limit'] > 1) {
            $limit = $data['limit'];
        }
        $sql = 'ORDER BY sort DESC,id DESC LIMIT :start,:count';
        $params = [
            ':start' => $start,
            ':count' => $limit,
        ];
        $results = self::find($sql, $params);
        return $results;
    }

    public function load($data) {
        parent::load($data);
        $this->images = [];
        if (isset($data['moreImage'])) {
            foreach ($data['moreImage'] as $key=>$imgSrc) {
                if (empty($imgSrc)) {
                    continue;
                }
                $newImg = [];
                $newImg['src'] = $imgSrc;
                if (isset($data['nameMoreImage'][$key])) {
                    $newImg['name'] = $data['nameMoreImage'][$key];
                }
                if (isset($data['sortMoreImage'][$key])) {
                    $newImg['sort'] = $data['sortMoreImage'][$key];
                }
                $this->images[] = $newImg;
            }
        }
    }

    public function save() {
        parent::save();
        if ($this->id) {
            $this->bean->xownArtphotoworkimageList = [];
            foreach ($this->images as $image) {
                $sort = 100;
                if (isset($image['sort']) && !empty($image['sort'])) {
                    $sort = (int)$image['sort'];
                }
                $imageBean = R::dispense('artphotoworkimage');
                $imageBean->src = $image['src'];
                $imageBean->name = $image['name'];
                $imageBean->sort = $sort;

                $this->bean->xownArtphotoworkimageList[] = $imageBean;
            }
        }
        R::store($this->bean);
    }

    public function getImages() {
        $this->images = [];
        foreach ($this->bean->xownArtphotoworkimageList as $item) {
            $itemImg = $item->export();
            if (empty($itemImg['sort'])) {
                $itemImg['sort'] = 100;
            }
            $this->images[] = $itemImg;
        }
    }

    public static function getLabelsStatus(){
        $res = [
            self::STATUS_OFF => 'Выключить',
            self::STATUS_ON => 'Включено',
        ];
        return $res;
    }

    public function getImagesForOut() {
        $this->getImages();
        usort($this->images, array("app\\models\\Photowork", "sortImage"));
    }

    public static function sortImage($image1, $image2) {
        if ($image1['sort'] < $image2['sort']) {
            return 1;
        }
        if ($image1['sort'] == $image2['sort']) {
            if ($image1['id'] == $image2['id']) {
                return 0;
            }
            return ($image1['id'] > $image2['id']) ? -1 : 1;
        }
        return -1;
    }

    public function getLabelStatus(){
        $statuses  = self::getLabelsStatus();
        return $statuses[$this->status];
    }

    /**
     * @return static[]
     */
    public static function getActiveList() {
        $start = 0;
        $limit = 100;
        if (isset($data['start']) && $data['start']>0) {
            $start = $data['start'];
        }
        if (isset($data['limit']) && $data['limit'] > 1) {
            $limit = $data['limit'];
        }
        $params = [
            ':start' => $start,
            ':count' => $limit,
            ':status' => 1,
        ];
        $sql = 'status = :status ORDER BY sort DESC,id DESC LIMIT :start,:count';
        $results = self::find($sql,$params);
        return $results;
    }

}