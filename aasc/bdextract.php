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
define(SQLDBNAME, "aasc");
//define(SQLUSER, "root");

$link = mysqli_connect("localhost", "root", "");
//var_dump($link);

// TODO добавить распаковку POST-запроса
//она приходит в виде переменных

$location = 1;  //Это стартовые данные запроса - которые приходят из ПОСТ * время, место, и сектор экономики
$sector = 1;
$start_time = 1;
$end_time = 12;

echo "<html><head>
<style>td {border: 1px solid black} table {border-collapse: collapse}</style></head><body>";

echo "<h3>Вы выбрали следующие показатели:</h3>";
echo "Отрасль хозяйства: "  . $_POST['part'] . "<br>";
echo "Регион: "  . $_POST['location'] . "<br>";
echo "За период с "  . $_POST['date_begin'] . " по " . $_POST['date_end'] . "<br>";
echo "<a href='post4.php'>Новый запрос</a><br>";

$table_html_begin = "<table><tbody>";
$table_html_end = '</tbody></table>';

$table_indicators = '';
for ($i=0; $i< 18; $i++) {
	$table_indicators .= "<tr><td>" . /*$indicators[$i]*/'indicator' . "</td>"; 
	for ($k=0; $k<36; $k++) {
		$table_indicators .= "<td>" . rand(100,1000) . "</td>";
	}
	$table_indicators .= "</tr>";

}

$table = $table_html_begin .  get_table_head(1,36)  . $table_indicators . $table_html_end;

echo $table;



