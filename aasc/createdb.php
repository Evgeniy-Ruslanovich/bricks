<?php
/**
 * Created by PhpStorm.
 * User: Admin
 * Date: 27.11.2016
 * Time: 15:12
 * Это файл создает и удаляет базу данных
 */

$link = mysqli_connect("localhost", "root", "");
mysqli_query($link, "create schema  `fruits1` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;");
mysqli_query($link, "CREATE TABLE `fruits1`.`fruits` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`)
)");

mysqli_query($link, "insert INTO `fruits1`.`fruits` (name) VALUES ('Яблоко');");
mysqli_query($link, "insert INTO `fruits1`.`fruits` (name) VALUES ('Груша');");
mysqli_query($link, "insert INTO `fruits1`.`fruits` (name) VALUES ('Апельсин');");


//

