<?php
// Path to the emotion check-in log
$log_file = '../../Echo_Memory_system/core_memory/echo_emotion_checkins.txt';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $emotion = trim($_POST['emotion'] ?? '');

    if (!empty($emotion)) {
        $timestamp = date('[Y-m-d H:i:s]');
        $line = "$timestamp $emotion\n";
        file_put_contents($log_file, $line, FILE_APPEND);
        echo "✅ Your emotion has been saved, thank you.";
    } else {
        echo "⚠️ Please select an emotion.";
    }
} else {
    echo "⚠️ Invalid request.";
}
?>
