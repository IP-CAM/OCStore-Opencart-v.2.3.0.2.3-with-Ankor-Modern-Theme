<?php

namespace app\core;
class App{
    /**
     * @var DataStore
     */
    public static $ds;
    /**
     * @var Debug
     */
    public static $debug;

    public static function Init() {
        App::$ds = new DataStore();
        App::$debug = new Debug();
    }

}