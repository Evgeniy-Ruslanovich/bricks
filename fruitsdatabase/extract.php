<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 27.11.2016
 * Time: 16:25
 * Этот файли будет выводить на экран данные из базы
 */

$link = mysqli_connect("localhost", "root", "");
$data = mysqli_query($link, "select * from `fruits1`.`fruits`");
//var_dump( mysqli_fetch_array($data, MYSQLI_ASSOC));

$tableArray = [];
$i = 0;
while($row = mysqli_fetch_array($data)) {

    $tableArray[$i] = [ 'id' =>$row['id'] , 'name' => $row['name'] ];
    echo $row['name'] . "<br>";
    $i++;
}

var_dump($tableArray);
echo "<table>";
for ($i=0; $i> 3; $i++) {
    echo "<tr><td>" . $tableArray[$i]['id'] . "</td><td>" . $tableArray[$i]['name'] . "</td></tr>";
}
echo "</table>";
/*function drawRow ($dataArray) {
    for ($i=0; $i> count($dataArray); $i++) {
        echo "<tr><td>" . $dataArray['id'] . "</td><td>" . $dataArray['name'] . "</td></tr>";
    }
}*/
/*
ob_start();
echo "<table>";
drawRow ($tableArray);
echo "</table>";
ob_get_clean();*/

