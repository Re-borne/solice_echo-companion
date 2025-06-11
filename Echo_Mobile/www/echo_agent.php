<?php
// 🌐 Allow browser requests from another port (like 3000)
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");

// 🗣️ Get message from browser
$message = $_POST['message'] ?? '';

if (!empty($message)) {
  // 🧠 Save to bridge for listener
  file_put_contents('/Users/danielcolyer/Desktop/master_echo_bulid/Echo_Memory_system/echo_agent/bridge_message.txt', $message);

  // ✍️ Save to last_command for reference
  file_put_contents('/Users/danielcolyer/Desktop/master_echo_bulid/Echo_Memory_system/echo_agent/last_command.txt', $message);

  echo "Echo received: $message";
} else {
  echo "No message received.";
}
?>

