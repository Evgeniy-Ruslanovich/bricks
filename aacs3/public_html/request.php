<?php


$location = (int)$_POST['location'];  //Это стартовые данные запроса - которые приходят из ПОСТ * время, место, и сектор экономики
$sector = (int)$_POST['sector'];
$start_time = (int)$_POST['date_begin'];
$end_time = (int)$_POST['date_end'];

require_once('../lib/dbextract.php');
