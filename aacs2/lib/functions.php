<?php


/*функция принимает в качестве агруметнов номер стартового и конечного месяцев, возвращает хтмл-версту таблицы с годами и месяцами*/
function get_table_head($start_time, $end_time){
	$start_years = [ //даем массив соответствия стартового месяца стартовуму году
	1 => 2001,
	13 => 2002,
	25 => 2003,
	37 => 2004,
	49 => 2005,
	61 => 2006,
	73 => 2007,
	85 => 2008,
	97 => 2009,
	109 => 2010,
	121 => 2011,
	133 => 2012,
	145 => 2013,
	157 => 2014,
	169 => 2015,
	181 => 2016
	];
	$end_years = [ //даем массив соответствия финального месяца финальному году - потом это можно бдует получать из базы
	12 => 2001,
	24 => 2002,
	36 => 2003,
	48 => 2004,
	60 => 2005,
	72 => 2006,
	84 => 2007,
	96 => 2008,
	108 => 2009,
	120 => 2010,
	132 => 2011,
	144 => 2012,
	156 => 2013,
	168 => 2014,
	180 => 2015,
	192 => 2016
	];
	$start_year = $start_years[$start_time];//получаем стартовый год
	$final_year = $end_years[$end_time];//получаем финальный год
	$year_count = $final_year - $start_year + 1;//получаем количество лет в таблице
	$table_head = '<tr><td colspan="1" rowspan="2"></td>';//первая ячейка - пустая

	$current_year = $start_year;
	for ($i=1; $i<= $year_count; $i++) { //рисуем первую строку - с годами
	$table_head .= "<td colspan=\"12\">" . $current_year . "</td>";
	$current_year++;
	}
	$table_head .= '</tr><tr>'; //закрываем предыдущую строку таблицы, открываем новую
	
	for ($i=1; $i<= $year_count; $i++) { // добавляем месяцы
	$table_head .= '<td>явн</td><td>фев</td><td>мар</td><td>апр</td><td>май</td><td>июн</td><td>июл</td><td>авг</td><td>сент</td><td>окт</td><td>ноя</td><td>дек</td>';
	}
	//рисуем вторую строку - с месяцами
	$table_head .= '</tr>'; //закрываем строку таблицы
	return $table_head;//возвращаем строку, где весь хтмл шапки таблицы
}


/*Функция возвращает ряд данных в виде массива -показатели по определенному индикатору, в определенносм месте - в заданном промежутке времени*/
function get_indicator_data($link, $indicator, $location, $sector, $start_time, $end_time) {
	$query = "SELECT `value` FROM `aasc`.`data` WHERE `indicator_id` = " . $indicator . " AND`location_id` = " . $location . " AND `sector_id` = " . $sector . " AND `time_id` >= " . $start_time . " AND `time_id` <= " . $end_time . "	 ORDER BY `time_id`";
	//$values_q_result = mysqli_query($link, "SELECT `value` FROM `aasc`.`data` WHERE `location_id` = 1 AND `sector_id` = 1 ORDER BY `time_id`");
	$values_q_result = mysqli_query($link, $query);
	$values_data_array = mysqli_fetch_all($values_q_result, MYSQLI_NUM);
	$values_array = [];
	foreach ($values_data_array as $value) {  //создаем простой прямой массив инидкаторов
	array_push($values_array, $value[0]);
	}

	return $values_array;
}