<?php

namespace app\libs;


use app\core\App;

class File{

    protected static $filePath;
    /**
     * Функция для скачивания файла с сервера с возможностью докачки,
     * требует предварительной установки ограничения времени выполнения сценария
     *
     * @param string $realFilePath
     * @return bool
     */
  public static function download($realFilePath) {
      self::$filePath = $realFilePath;
        // вначале проверим, что файл существует
        if(!file_exists(self::$filePath)) {
            return false;
        }
        // соберем необходимую информацию о файле
        $fileInfo      = self::getFileInfo();
        // Формируем HTTP-заголовки ответа
        $rangePosition = self::setHeader($fileInfo,'download');
        // теперь необходимо встать на позицию $rangePosition и выдать в поток содержимое файла
        if(self::outputFile($rangePosition)){
            return true ;
        }
        return false;
    }

    public  static function open($realFilePath){
        self::$filePath = $realFilePath;
        if(!file_exists(self::$filePath)) {
            return false;
        }
        $fileInfo      = self::getFileInfo();
        $rangePosition = self::setHeader($fileInfo,'open');
        if(self::outputFile($rangePosition)){
            return true ;
        }
        return false;
    }

    protected static function getTypes() {
        return array (
            'pdf' => 'application/pdf',
            'exe' => 'application/octet-stream',
            'zip' => 'application/x-zip-compressed',
            'rar' => 'application/x-rar-compressed',
            'doc' => 'application/msword',
            'xls' => 'application/excel',
            'xlsx'=> ' application/vnd.openxmlformats-officedocument.spreadsheetml.sheet',
            'ppt' => 'application/vnd.ms-powerpoint',
            'gif' => 'image/gif',
            'png' => 'image/png',
            'jpe' => 'jpeg',
            'jpg' => 'image/jpg'
        );
    }

    public static function getFileInfo(){

        $fileInfo['CLen'] = filesize(self::$filePath);
        $fileInfo['filename'] = basename(self::$filePath); // запрашиваемое имя
        $fileInfo['file_extension'] = strtolower(substr(strrchr($fileInfo['filename'], '.'), 1));
        // Краткий перечень mime-типов
        $fileInfo['fileCType'] = 'application/octet-stream';
        $CTypes = self::getTypes();
        // Если расширение есть в перечне, присвоим соответствующий mime тип,
        // иначе остается общий
        if(isset($CTypes[$fileInfo['file_extension']])) {
            $fileInfo['fileCType'] = $CTypes[$fileInfo['file_extension']];
        }
        return $fileInfo;
    }

    public static function setHeader($fileInfo,$request){
        $contentDisposition = 'attachment';
        if($request == 'open'){
            $contentDisposition = 'inline';
        }
        // $_SERVER['HTTP_RANGE'] — номер байта, c которого надо возобновить передачу содержимого файла.
        // проверим, что заголовок Range: bytes=range- был послан браузером или менеджером закачек
        if(isset($_SERVER['HTTP_RANGE'])) {
            $matches = array();
            if(preg_match('/bytes=(\d+)-/', $_SERVER['HTTP_RANGE'], $matches)) {
                $rangePosition = intval($matches[1]);
                $newCLen = $fileInfo['CLen'] - $rangePosition;
                header ( 'HTTP/1.1 206 Partial content', true, 200 );
                header ( 'Status: 206 Partial content' );
                // Last-Modified - Дата послднего изменения содержимого. Поле актуально только для
                // статических страниц. Apache заменяет это поле значением поля Date для динамически
                // генерируемых страниц, в том числе для страниц содержащих SSI.
                header ( 'Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');// always modified
                // HTTP/1.1
                // Cache-control: no-cache - Управление кэш. Значение no-cache определяет запрет кэш
                // данной страницы. Для версии протокола HTTP/1.0 действует "Pragma: no-cache".
                header ( 'Cache-Control: no-store, no-cache, must-revalidate ');
                header ( 'Cache-Control: post-check=0, pre-check=0', false);
                // HTTP/1.0
                header ( 'Pragma: no-cache' );
                header ( 'Accept-Ranges: bytes');
                header ( 'Content-Range: bytes ' . $rangePosition . '-' . $fileInfo['CLen'] - 1 . '/' . $fileInfo['CLen']);
                header ( 'Content-Length: ' . $newCLen );
                header ( 'Content-Disposition: '.$contentDisposition.'; filename="' .  $fileInfo['filename']  . '"' );
                header ( 'Content-Description: File Transfer' );
                header ( 'Content-Type: ' . $fileInfo['fileCType'] );
                header ( 'Content-Transfer-Encoding: binary');
            }
            else {
                return false;
            }
        }
        else {
            header ( 'HTTP/1.1 200 OK', true, 200 );
            header ( 'Status: 200 OK' );
            // Last-Modified - Дата послднего изменения содержимого. Поле актуально только для
            // статических страниц. Apache заменяет это поле значением поля Date для динамически
            // генерируемых страниц, в том числе для страниц содержащих SSI.
            header ( 'Last-Modified: ' . gmdate('D, d M Y H:i:s') . ' GMT');// always modified
            // HTTP/1.1
            // Cache-control: no-cache - Управление кэш. Значение no-cache определяет запрет кэш
            // данной страницы. Для версии протокола HTTP/1.0 действует "Pragma: no-cache".
            header ( 'Cache-Control: no-store, no-cache, must-revalidate ');
            header ( 'Cache-Control: post-check=0, pre-check=0', false);
            // HTTP/1.0
            header ( 'Pragma: no-cache' );
            header ( 'Accept-Ranges: bytes');
            header ( 'Content-Length: ' .  $fileInfo['CLen'] );
            header ( 'Content-Disposition:'.$contentDisposition.'; filename="' .  $fileInfo['filename']  . '"' );
            header ( 'Content-Description: File Transfer' );
            header ( 'Content-Type: ' . $fileInfo['fileCType'] );
            header ( 'Content-Transfer-Encoding: binary');
            $rangePosition = 0;
        }

        return $rangePosition;

    }

    public static function outputFile($rangePosition){
        $handle = @fopen(self::$filePath, 'rb');
        if ($handle) {
            fseek($handle, $rangePosition);
            while(!feof($handle) and !connection_status()) {
                print fread($handle, (1024 * 8));
            }
            return true;
        } else {
            return false;
        }
    }

}