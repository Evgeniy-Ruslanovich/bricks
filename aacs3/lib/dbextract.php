<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 27.11.2016
 * Time: 16:25
 * Этот файлик будет выводить на экран данные из базы уже в виде таблицы
 */

require_once('functions.php');

require_once('config.php');
//define(SQLUSER, "root");

$link = mysql_connect(SQLHOST, SQLUSER, SQLPASSW);
echo "<html><head>
<style>td {border: 1px solid black} table {border-collapse: collapse}</style></head><body>";

//var_dump($link);
//echo '<hr>';

// TODO добавить распаковку POST-запроса
//она приходит в виде переменных

//TODO добавить распаковку имен индикаторов

$indicators_data = mysql_query("SELECT `id`,`indicator_name_rus`FROM `aasc`.`indicators`", $link); //пучком
//var_dump($indicators_data);
//echo '<hr>';

/*
$indicators_data_array = mysqli_fetch_all($indicators_data, MYSQLI_NUM);
$indicators_array = array();
foreach ($indicators_data_array as $value) {  //создаем массив инидкаторов
array_push($indicators_array, $value[1]);
}*/

$indicators_array = array();
while ($row = mysql_fetch_row($indicators_data)) {
	array_push($indicators_array, $row[1]);
}

//var_dump($indicators_array);
//echo '<hr>';
/*
$location = (int)$_POST['location'];  //Это стартовые данные запроса - которые приходят из ПОСТ * время, место, и сектор экономики
$sector = (int)$_POST['sector']
$start_time = (int)$_POST['date_begin'];
$end_time = (int)$_POST['date_end'];*/

echo "<html><head>
<style>td {border: 1px solid black} table {border-collapse: collapse}</style></head><body>";

echo "<h3>Вы выбрали следующие показатели:</h3>";
echo "Отрасль хозяйства: "  . $_POST['sector'] . "<br>";
echo "Регион: "  . $_POST['location'] . "<br>";
echo "За период с "  . $_POST['date_begin'] . " по " . $_POST['date_end'] . "<br>";
echo "<a href='../public_html/index.php'>Новый запрос</a><br>";



$table_html_begin = "<table><tbody>";//начало вывода таблицы
$table_html_end = '</tbody></table>';

//$start_time = 1;
//$end_time = 12;

$cells_count = $end_time - $start_time + 1;

$table_indicators = '';
for ($i=1; $i<= count($indicators_array); $i++) {

	$indicator1 = get_indicator_data($link, $i, $location, 1, $start_time, $end_time);
	$table_indicators .= "<tr><td>" . $indicators_array[$i-1] .
	//'indicator' .
	 "</td>"; 
	for ($k=0; $k<$cells_count; $k++) {
		$table_indicators .= "<td>" . $indicator1[$k] . "</td>";
	}
	$table_indicators .= "</tr>";

}

$table = $table_html_begin .  get_table_head($start_time,$end_time)  . $table_indicators . $table_html_end;

echo $table;

/*
$indicator1 = get_indicator_data($link, 1, 1, 1, 1, 12);
var_dump($indicator1);*/