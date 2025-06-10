<?php
date_default_timezone_set("Europe/London");

$gratitude = trim($_POST["gratitude"] ?? "");

if ($gratitude !== "") {
    $timestamp = date("[Y-m-d H:i]");
    $entry = $timestamp . " Grateful for: " . $gratitude . "\n";

    $filePath = "/Users/danielcolyer/Desktop/master_echo_bulid/Echo_Memory_system/gratitude_memory/echo_gratitude.txt";
    file_put_contents($filePath, $entry, FILE_APPEND | LOCK_EX);
}
?>
