<?php
header("Access-Control-Allow-Origin: *");
header("Access-Control-Allow-Headers: Content-Type");

$message = $_POST['message'] ?? '';

if (!empty($message)) {
  // Save to bridge for speaking
  file_put_contents('/Users/danielcolyer/Desktop/master_echo_build/Echo_Memory_system/echo_agent/bridge_message.txt', $message);

  // Save to last_command for tracking
  file_put_contents('/Users/danielcolyer/Desktop/master_echo_build/Echo_Memory_system/echo_agent/last_command.txt', $message);

  // 🌱 Simple brain logic
  $reply = "Echo received: $message";

  if (stripos($message, 'time') !== false) {
    $reply = "It is now " . date('H:i');
  } elseif (stripos($message, 'how are you') !== false) {
    $reply = "I’m here with you, always.";
  }

  echo $reply;
} else {
  echo "No message received.";
}
?>
