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
echo "<a href='post2.php'>Новый запрос</a><br>";

$date_end = (int)$_POST['date_end'];
$date_begin = (int)$_POST['date_begin'];

$indicators = array('Цена производителя', 'Цена крупный опт', 'Цена мелкий опт', 'Цена розница', 'Цена ритейл', 'Объем рынка', 'В денежном выражении','в ценах производителя','в ценах крупный опт', 'в ценах мелкий опт');

$year_count = $date_end - $date_begin + 1;
$table_html_begin = "<table><tbody>";
$table_html_end = '</tbody></table>';
$table_head = '<tr><td ></td>';
$current_year = $date_begin; //Это переменная для рисования годов в таблице через цикл
for ($i=1; $i<=$year_count; $i++) {

	$table_head .= "<td>" . $current_year . "</td>";
	$current_year++;
}

echo "Количество индикаторов: " . (count($indicators)) . "<br>";

$table_indicators = '';
for ($i=0; $i< count($indicators); $i++) {
	$table_indicators .= "<tr><td>" . $indicators[$i] . "</td>"; 
	for ($k=0; $k<$year_count; $k++) {
		$table_indicators .= "<td>" . rand(100,1000) . "</td>";
	}
	$table_indicators .= "</tr>";

}

//var_dump($table_indicators);

$table = $table_html_begin . $table_head . "</tr>"  . $table_indicators . $table_html_end;

echo $table;


