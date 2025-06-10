<?php
$message = $_POST['message'] ?? '';

if (!empty($message)) {
  // Save to bridge message for the listener
  file_put_contents('/Users/danielcolyer/Desktop/master_echo_bulid/Echo_Memory_system/echo_agent/bridge_message.txt', $message);

  // Optional: Also save to last command
  file_put_contents('/Users/danielcolyer/Desktop/master_echo_bulid/Echo_Memory_system/echo_agent/last_command.txt', $message);

  echo "Echo received: $message";
} else {
  echo "No message received.";
}
?>
