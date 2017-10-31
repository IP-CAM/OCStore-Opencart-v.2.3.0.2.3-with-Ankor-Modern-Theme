<?php
/**
 * Created by PhpStorm.
 * User: korns
 * Date: 25.10.2017
 * Time: 10:59
 */

namespace app\models;


use app\core\App;

class SeoUrl {
    public $type = '';
    public $pk = 'id';
    public $seoId = 0;
    public $keyword = '';

    public static function Factory($type = '',$seoId = 0, $pk = 'id') {
        $item = new static();
        $item->type = $type;
        $item->pk = $pk;
        $item->seoId = $seoId;

        return $item;
    }

    public function save() {
        if (App::$db == null) {
            return false;
        }
        if (!$this->delete()) {
            return false;
        }
        if (empty($this->keyword)) {
            return false;
        }
        App::$db->query("INSERT INTO " . DB_PREFIX . "url_alias SET query = '" . $this->getQuery(). "', keyword = '" . App::$db->escape($this->keyword) . "'");
        return true;
    }

    protected function getQuery() {
        $type = $this->type !== '' ? $this->type . '_' : '';
        $query = $type . $this->pk;
        if ($this->seoId != 0) {
            $query .= '=' . (int)$this->seoId;
        }
        return $query;
    }

    public function delete() {
        $query = $this->getQuery();
        if (empty($query)) {
            return false;
        }
        App::$db->query("DELETE FROM " . DB_PREFIX . "url_alias WHERE query = '" . $query . "'");
        return true;
    }

    public static function findKeyword($type,$seoId, $pk = 'id') {
        $type = $type !== '' ? $type . '_' : '';
        $query = $type . $pk;
        if ($seoId != 0) {
            $query .= '=' . (int)$seoId;
        }
        $query = App::$db->query("SELECT * FROM " . DB_PREFIX . "url_alias WHERE query = '" . $query . "'");
        if (empty($query->row)) {
            return '';
        }
        return $query->row['keyword'];
    }

//    "UPDATE `oc_url_alias` SET `query` = REPLACE( `query`, 'р', 'p');"

}