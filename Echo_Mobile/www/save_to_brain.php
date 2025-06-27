<?php
// 🌐 Allow from browser
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");

$data = json_decode(file_get_contents("php://input"), true);
$message = $data['message'] ?? '';

if (!empty($message)) {
  // Set file path in Echo Brain Core Memories
  $timestamp = date("Y-m-d_H-i-s");
  $safe_message = preg_replace("/[^a-zA-Z0-9]/", "_", substr($message, 0, 30));
  $filename = "/Users/danielcolyer/Desktop/master_echo_build/Echo_Memory_system/core_memory/Echo_Brain/Core_Memories/echo_memory_{$timestamp}_{$safe_message}.txt";

  file_put_contents($filename, $message);
  echo "Saved to memory: $filename";
} else {
  echo "No message provided.";
}
?>
