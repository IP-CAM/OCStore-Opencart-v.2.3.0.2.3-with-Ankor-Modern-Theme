<?php

namespace app\models;


use app\libs\Upload;
use R;

/**
 * Class Certificate
 * @package app\models
 * @property string title
 * @property string image
 * @property string description
 * @property string metaTitle
 * @property string metaDescription
 * @property string nameImage
 * @property int status
 * @property int sort
 * @property array files
 */
class Certificate extends AppModel {
    const STATUS_OFF = 0;
    const STATUS_ON = 1;

    protected static $tableName = 'artcerts';
    protected $attributes = [
        'title' => '',
        'metaTitle' => '',
        'metaDescription' => '',
        'description'=> '',
        'status' => self::STATUS_OFF,
        'image' => '',
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
                $this->images[] = $newImg;
            }
        }
    }

    public function save() {
        parent::save();
        if ($this->id) {
            $this->bean->xownArtcertmoreimageList = [];
            foreach ($this->images as $image) {
                $imageBean = R::dispense('artcertmoreimage');
                $imageBean->src = $image['src'];
                $imageBean->name = $image['name'];
                $this->bean->xownArtcertmoreimageList[] = $imageBean;
            }
        }
        R::store($this->bean);
    }

    public function getImages() {
        $this->images = [];
        foreach ($this->bean->xownArtcertmoreimageList as $item) {
            $this->images[] = $item->export();
        }
    }

    public static function getLabelsStatus(){
        $res = [
            self::STATUS_OFF => 'Выключить',
            self::STATUS_ON => 'Включено',
        ];
        return $res;
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