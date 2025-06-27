<?php
// File to store the conversation log
$logFile = '/Users/danielcolyer/Desktop/master_echo_build/Echo_Memory_system/Conversation_logs/conversation_log.json';


if (file_exists($logFile)) {
    header('Content-Type: application/json');
    echo file_get_contents($logFile);
} else {
    echo json_encode([]);
}
?>
