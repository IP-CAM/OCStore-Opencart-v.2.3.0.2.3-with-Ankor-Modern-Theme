<?php

namespace app\models;


use app\libs\Upload;
use R;

/**
 * Class Documents
 * @package app\models
 * @property string title
 * @property int status
 * @property int sort
 */
class Documents extends AppModel {
    const STATUS_OFF = 0;
    const STATUS_ON = 1;

    protected static $tableName = 'documents';
    protected $attributes = [
        'title' => '',
        'status' => self::STATUS_OFF,
        'sort'=> 0
    ];

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
        return self::find($sql, $params);
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

    public function saveFiles($files) {
        if (!$this->id) {
            return false;
        }
        $files = $this->uploadFiles($files);
        $this->bean->xownArtfilesdocumentsList = array();
        foreach ($files as $file) {

            $fileBean = R::dispense('artfilesdocuments');
            $fileBean->name = $file['fileName'];
            $fileBean->originalFilename = $file['original_filename'];
            $fileBean->extension= $file['extension'];
            $fileBean->path= $file['path'];
            $this->bean->xownArtfilesdocumentsList[] = $fileBean;
        }
        $this->id = R::store($this->bean);
        return true;
    }

    protected function uploadFiles($files){
        if (empty($files)) {
            return false;
        }
        $uploadedFiles = [];
        $i = 0;
        $nameFile = 'file_' . $i;
        while (isset($files[$nameFile])) {
            $upload = Upload::factory('system/upload/storage/documents');
            $upload->file($files[$nameFile]);
            $result = $upload->upload();
            if (empty($upload->get_errors())) {
                $uploadedFiles[] = $result;
            }
            $i++;
            $nameFile = 'file_' . $i;
        }
        return $uploadedFiles;
    }
}