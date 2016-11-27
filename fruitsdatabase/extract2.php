<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 27.11.2016
 * Time: 16:25
 * Этот файлик будет выводить на экран данные из базы уже в виде таблицы
 */

$link = mysqli_connect("localhost", "root", "");
$data = mysqli_query($link, "select * from `fruits1`.`fruits`");
//var_dump( mysqli_fetch_array($data, MYSQLI_ASSOC));

$tableArray = []; //создали массив, запихиваем в него данные из базы. По крайней мере этот массив мне понятен, а дефолтный не очень понятен
$i = 0;
while($row = mysqli_fetch_array($data)) {

    $tableArray[$i] = [ 'id' =>$row['id'] , 'name' => $row['name'] ];
    echo $row['name'] . "<br>";

    $i++;
}
echo $i ;

//var_dump($tableArray);
echo "<table style='border-collapse: collapse; border: 1px solid grey;'>";
for ($i=0; $i< 3; $i++) {
    echo ("<tr><td>" . $tableArray[$i]['id'] . "</td><td>" . $tableArray[$i]['name'] . "</td></tr>");
}
echo "</table>";
function drawRow ($dataArray) {
    for ($i=0; $i<  count($dataArray); $i++) {
        echo "<tr><td>" . $dataArray[$i]['id'] . "</td><td>" . $dataArray[$i]['name'] . "</td></tr>";
    }
}

ob_start();
echo "<table><tbody>";
drawRow ($tableArray);
echo "</tbody></table>";
ob_end_flush();

