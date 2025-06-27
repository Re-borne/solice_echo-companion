<?php
$data = json_decode(file_get_contents('php://input'), true);
if (!$data) {
  http_response_code(400);
  echo "No data received.";
  exit;
}

$logDir = "/Users/danielcolyer/Desktop/master_echo_build/Echo_Memory_system/conversation_logs";
if (!file_exists($logDir)) {
  mkdir($logDir, 0777, true);
}

$logFile = $logDir . "/conversation_log.txt";
$entry = "[" . $data['timestamp'] . "] " . ucfirst($data['sender']) . ": " . $data['message'] . "\n";
file_put_contents($logFile, $entry, FILE_APPEND);

echo "Saved";
