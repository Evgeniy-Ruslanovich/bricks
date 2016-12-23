<?php

error_reporting(E_ALL);

$location = $_POST['location'];
$sector = $_POST['sector'];
$start_time = (int)$_POST['date_begin'];
$end_time = (int)$_POST['date_end'];

echo 'место ' . $location .' сектор ' . $sector . ' старт ' . $start_time . ' конец ' . $end_time . ' <br>';

require_once('../lib/dbfill.php');
//require_once('config.php');

fill_db_random ($link, $location, $sector, $start_time, $end_time);
//fill_db_random ($link, 1,1,37,192); выполнено, москва заполнена
echo "<a href='fill.php'>Новый запрос</a><br>";