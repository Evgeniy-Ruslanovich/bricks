<?php

error_reporting(E_ALL);

require_once('../lib/config.php');

$link = mysqli_connect(SQLHOST, SQLUSER, SQLPASSW);

if($link) {echo 'соединение с базой установлено <br>';}
/*
$sector = $_POST['sector'] . "<br>";
echo "Регион: "  . $_POST['location'] . "<br>";
echo "За период с "  . $_POST['date_begin'] . " по " . $_POST['date_end'] . "<br>";
//echo "<a href='../public_html/fill.php'>Новый запрос</a><br>";
*/
function value_generate ($location, $sector, $time, $indicator) {
		$location = $location/100;
		$indicator = $indicator*100;
		$time = $time*10000;
		$value = $time + $indicator + $sector + $location;
		return $value;
}
//echo value_generate (1, 1, 5, 25);

/*
Эта функция должна создать строку для запроса в бд с набором данных, которые будут впихиваться туда.
Важно - порядок полей в запросе строго такой - локация, сектор, время, индикатор, значение.
*/
function values_string_year_generator ($location, $sector, $start_time, $end_time) {  //Арументы - место (москва), сектор (рога\копыта), время - с какого по какой месяц
		$values_string = '';
		$values_array = [];

		for ($k=$start_time; $k<=$end_time; $k++)	{  //это сектр забивает показатели по индикаторам для рогов в Москве в заданный интервал времени
				for ($i=1; $i<= 38; $i++) {  //'этот цикл заоплняет данными массив, для одной локации, сектора и времени - по 38 индикаторам'
					$query_part = "(" . $location . "," . $sector . "," . $k . "," . $i . "," . value_generate($location, $sector, $k, $i) .")";
					//echo $query_part . "<br>";
					array_push($values_array, $query_part);

				}
		}


		//var_dump($values_array);
		$values_string = implode(",", $values_array);
		//var_dump($values_string);
		return $values_string;
}
/*УРА, РАБОТАЕТ!!!!!*/
//echo values_string_year_generator(1,1,13,24);
/*Итак, мы можемсгенерировать данные для локации и сектора, при указании промежутка времени. Чтож, попроуем это теперь пихнуть в базу*/


/**/
function fill_db_random ($link, $location, $sector, $start_time, $end_time) {
	$values_string = values_string_year_generator($location, $sector, $start_time, $end_time);
	$query = "INSERT INTO `aasc`.`data` (`location_id`, `sector_id`, `time_id`, `indicator_id` , `value`) VALUES " . $values_string;
	if (mysqli_query($link, $query)) {echo 'запрос выполнен успешно <br>';} else {echo 'запрос  не выполнен <br>';}

}
//fill_db_random ($link, 1,1,25,36); выполнено
//fill_db_random ($link, 1,1,24,192); // москва заполнение
//fill_db_random ($link, 2,1,1,192);

/* //заполнение для сектора 1, половина локаций, кроме москвы
for ($e = 2; $e <= 42; $e++) {
	fill_db_random ($link, $e,1,1,192);
}
*/

/* //заполнение для сектора 1, вторая половина локаций, кроме москвы
for ($e = 43; $e <= 84; $e++) {
	fill_db_random ($link, $e,1,1,192);
}
*/

/* //заполнение для сектора 2, половина локаций
for ($e = 1; $e <= 42; $e++) {
	fill_db_random ($link, $e,2,1,192);
}
*/

/* //заполнение для сектора 2, вторая половина локаций
for ($e = 43; $e <= 84; $e++) {
	fill_db_random ($link, $e,2,1,192);
}
*/

/* //заполнение для сектора 3, половина локаций
for ($e = 1; $e <= 42; $e++) {
	fill_db_random ($link, $e,3,1,192);
}
*/

/* //заполнение для сектора 3, вторая половина локаций
for ($e = 43; $e <= 84; $e++) {
	fill_db_random ($link, $e,3,1,192);
}
*/

/* //заполнение для сектора 4, половина локаций
for ($e = 1; $e <= 42; $e++) {
	fill_db_random ($link, $e,4,1,192);
}
*/

/* //заполнение для сектора 2, вторая половина локаций
for ($e = 43; $e <= 84; $e++) {
	fill_db_random ($link, $e,4,1,192);
}
*/

/* //заполнение для сектора 5, половина локаций
for ($e = 1; $e <= 42; $e++) {
	fill_db_random ($link, $e,5,1,192);
}
*/

/* //заполнение для сектора 5, вторая половина локаций
for ($e = 43; $e <= 84; $e++) {
	fill_db_random ($link, $e,5,1,192);
}
*/