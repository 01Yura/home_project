<?php
// Получение IP-адреса клиента
$client_ip = $_SERVER['REMOTE_ADDR'];

// Вывод информации на экран с использованием HTML-тегов для изменения размера шрифта
echo "<h1>Ваш IP-адрес: <span style='font-size: 24px;'>$client_ip</span></h1>";
?>