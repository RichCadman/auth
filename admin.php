<?php
//应用文件入口
//检查PHP环境
if(version_compare(PHP_VERSION,'5.3.0','<')) die('require PHP > 5.3.0 !');
//定义编码方式
header("content-type:text/html;charset=utf-8");
//绑定默认模块
define("BIND_MODULE","Admin");
//定义缓存目录
define("APP_PATH","App/");
//开启调试模式，
define("APP_DEBUG",true);
//引入thinkPHP入口文件
include_once './lib/Thinkphp/ThinkPHP.php';