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
    /**
     * @var Config
     */
    public static $config;
    /**
     * @var \DB
     */
    public static $db;
    /**
     * @var Cache
     */
    public static $cache;
    /**
     * @var \Registry
     */
    public static $registry;

    public static function Init($registry) {
        App::$ds = new DataStore();
        App::$registry = $registry;
        App::$debug = new Debug();
        App::$config = new Config();
        App::$cache = new Cache();
    }


}