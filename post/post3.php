<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 18.12.2016
 * Time: 20:55
 */
echo "<html><head>
<style>td {border: 1px solid black} table {border-collapse: collapse}</style></head><body>";

echo "<h3>Вы выбрали следующие показатели:</h3>";
echo "Отрасль хозяйства: "  . $_POST['part'] . "<br>";
echo "Регион: "  . $_POST['location'] . "<br>";
echo "За период с "  . $_POST['date_begin'] . " по " . $_POST['date_end'] . "<br>";
echo "<a href='post2.php'>Новый запрос</a>";

$date_end = (int)$_POST['date_end'];
$date_begin = (int)$_POST['date_begin'];

$year_count = $date_end - $date_begin + 1;
$table_html_begin = "<table><tbody>";
$table_html_end = '</tbody></table>';
$table_head = '<tr><td></td>';
$current_year = $date_begin; //Это переменная для рисования годов в таблице через цикл
for ($i=1; $i<=$year_count; $i++) {

	$table_head .= "<td>" . $current_year . "</td>";
	$current_year++;
}

$table = $table_html_begin . $table_head . "</tr>" . $table_html_end;

echo $table;

$indicators = array('Цена производителя', 'Цена крупный опт', 'Цена мелкий опт', 'Цена розница', 'Цена ритейл');
