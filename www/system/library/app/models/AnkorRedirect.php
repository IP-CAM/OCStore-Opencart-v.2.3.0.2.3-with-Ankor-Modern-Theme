<?php

namespace app\models;
use app\core\App;


/**
 * Class AnkorRedirect
 * @package app\models
 * @property  string link
 * @property  string redirect
 */
class AnkorRedirect extends AppModel  {

    protected static $tableName = 'ankorredirects';
    public $attributes = [
        'link' => '',
        'redirect' => ''
    ];


    public static function getListAdmin($data) {
        $start = 0;
        $limit = 10;
        if (isset($data['start']) && $data['start']>0) {
            $start = $data['start'];
        }
        if (isset($data['limit']) && $data['limit'] > 1) {
            $limit = $data['limit'];
        }
        $sql = 'ORDER BY link ASC,id DESC LIMIT :start,:count';
        $params = [
            ':start' => $start,
            ':count' => $limit,
        ];
        return self::find($sql, $params);
    }

    public static function getList() {
        $cacheRes = App::$cache->get('ankor_redirect');
        if (!$cacheRes) {
            $data = AnkorRedirect::find('');
            App::$cache->set('ankor_redirect',$data,24*3600);
            return $data;
        }
        return $cacheRes;
    }

    public static function clearCache() {
        App::$cache->delete('ankor_redirect');
    }

    public static function getByLink($link) {
        $items = self::getList();
        $res = new AnkorRedirect();
        foreach ($items as $item) {
            if ($item->link === $link) {
                $res = $item;
                break;
            }
        }
        return $res;
    }



}