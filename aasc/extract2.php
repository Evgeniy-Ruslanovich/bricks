<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 27.11.2016
 * Time: 16:25
 * Этот файлик будет выводить на экран данные из базы уже в виде таблицы
 */

$link = mysqli_connect("localhost", "root", "");
//var_dump($link);
$data = mysqli_query($link, "select * from `fruits1`.`fruits`");
//var_dump( mysqli_fetch_array($data, MYSQLI_ASSOC));
var_dump($data);
$tableArray = []; //создали массив, запихиваем в него данные из базы. По крайней мере этот массив мне понятен, а дефолтный не очень понятен


$tableArray = mysqli_fetch_all($data, MYSQLI_ASSOC);

var_dump($tableArray);


