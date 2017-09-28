<?php
function getLimitStr($str,$limit) {
    if (utf8_strlen($str) <= ($limit - 3)) {
        return $str;
    }
    $res = utf8_substr($str,0, $limit) . '...';
    return $res;
}