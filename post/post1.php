<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 18.12.2016
 * Time: 20:55
 */

if (isset ($_POST['name'])){
    echo $_POST['name'] . '<br>';
}

?>
<form action="post1.php" method="post">
 <p>Ваше имя: <input type="text" name="name" value="<?= $_POST['name'] ?> "/></p>
 <p>Ваш возраст: <input type="text" name="age" value="<?= $_POST['age'] ?> "/></p>
 <p><input type="submit" /></p>
</form>
