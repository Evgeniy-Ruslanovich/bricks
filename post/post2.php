<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 18.12.2016
 * Time: 20:55
 */

if (isset ($_POST)){
	var_dump($_POST);
    echo '<br>';
}

?>
<form action="post3.php" method="post">
 <p>Отрасль:
	 <select name="part">
	 <option value="1">Рога</option>
	 <option value="2">Копыта</option>
	 <option value="3">Гусиное перо</option>
	 <option value="4">Утиные клювы</option>
	 <option value="5">Свиные хвосты</option>
	 <option value="6">Кошачий корм</option>
 </select>
 </p>
 <p>Локация<select name="location">
 <option value="CFO">ЦФО</option>
 <option value="SZFO">СЗФО</option>
 <option value="PFO">ПФО</option>
 <option value="SKFO">СКФО</option>
 <option value="DFO">ДФО</option>
 <option value="FFO">ФФО</option>
 </select>
 </p>
 <p> Дата с:<select name="date_begin">
 <option value="2010">2010</option>
 <option value="2011">2011</option>
 <option value="2012">2012</option>
 <option value="2013">2013</option>
 <option value="2014">2014</option>
 <option value="2015">2015</option>
 <option value="2016">2016</option>
 </select>
 
  Дата по:<select name="date_end">
 <option value="2010">2010</option>
 <option value="2011">2011</option>
 <option value="2012">2012</option>
 <option value="2013">2013</option>
 <option value="2014">2014</option>
 <option value="2015">2015</option>
 <option value="2016">2016</option>
 </select>
 </p>
 <p><input type="submit" /></p>
</form>
