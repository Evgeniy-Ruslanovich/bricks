<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 27.11.2016
 * Time: 16:25
 * Этот файлик будет выводить на экран данные из базы уже в виде таблицы
 */

require_once('functions.php');

define(SQLHOST, "localhost");
define(SQLUSER, "root");
define(SQLPASSW, "");
define(SQLDBNAME, `aasc`);
//define(SQLUSER, "root");

$link = mysqli_connect(SQLHOST, SQLUSER, SQLPASSW);
echo "<html><head>
<style>td {border: 1px solid black} table {border-collapse: collapse}</style></head><body>";

//var_dump($link);
//echo '<hr>';

// TODO добавить распаковку POST-запроса
//она приходит в виде переменных

//TODO добавить распаковку имен индикаторов

$indicators_data = mysqli_query($link, "SELECT `id`,`indicator_name_rus`FROM `aasc`.`indicators`"); //пучком
//var_dump($indicators_data);
//echo '<hr>';
$indicators_data_array = mysqli_fetch_all($indicators_data, MYSQLI_NUM);

//var_dump($indicators_data_array);
//echo '<hr>';

$indicators_array = [];

foreach ($indicators_data_array as $value) {  //создаем массив инидкаторов
array_push($indicators_array, $value[1]);
}

//var_dump($indicators_array);
//echo '<hr>';

$location = 1;  //Это стартовые данные запроса - которые приходят из ПОСТ * время, место, и сектор экономики
$sector = 1; //$_POST['sector']
$start_time = (int)$_POST['date_begin'];
$end_time = (int)$_POST['date_end'];

echo "<html><head>
<style>td {border: 1px solid black} table {border-collapse: collapse}</style></head><body>";

echo "<h3>Вы выбрали следующие показатели:</h3>";
echo "Отрасль хозяйства: "  . $_POST['sector'] . "<br>";
echo "Регион: "  . $_POST['location'] . "<br>";
echo "За период с "  . $_POST['date_begin'] . " по " . $_POST['date_end'] . "<br>";
echo "<a href='post4.php'>Новый запрос</a><br>";



$table_html_begin = "<table><tbody>";//начало вывода таблицы
$table_html_end = '</tbody></table>';

$start_time = 1;
$end_time = 24;

$cells_count = $end_time - $start_time + 1;

$table_indicators = '';
for ($i=0; $i< count($indicators_array); $i++) {
	$table_indicators .= "<tr><td>" . $indicators_array[$i] .
	//'indicator' .
	 "</td>"; 
	for ($k=0; $k<$cells_count; $k++) {
		$table_indicators .= "<td>" . rand(100,1000) . "</td>";
	}
	$table_indicators .= "</tr>";

}

$table = $table_html_begin .  get_table_head($start_time,$end_time)  . $table_indicators . $table_html_end;

echo $table;


$indicator1 = get_indicator_data($link, 1, 1, 1, 1, 12);
var_dump($indicator1);