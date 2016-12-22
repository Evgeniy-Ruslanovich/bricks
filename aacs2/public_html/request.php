<?php


$location = 1;  //Это стартовые данные запроса - которые приходят из ПОСТ * время, место, и сектор экономики
$sector = 1; //$_POST['sector']
$start_time = (int)$_POST['date_begin'];
$end_time = (int)$_POST['date_end'];

require_once('../lib/dbextract.php');
