<?php
// File path to save spoken journal entries
$journal_file = '../../Echo_Memory_system/core_memory/echo_spoken_journal.txt';

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $entry = trim($_POST['entry'] ?? '');
    $tag = trim($_POST['tag'] ?? '');

    if (!empty($entry)) {
        $timestamp = date('[Y-m-d H:i:s]');
        $tagged = $tag ? " $tag" : "";
        $full_entry = "$timestamp $entry$tagged\n";

        file_put_contents($journal_file, $full_entry, FILE_APPEND);
        echo "✅ Entry saved at $timestamp";
    } else {
        echo "⚠️ No entry to save.";
    }
} else {
    echo "⚠️ Invalid request method.";
}
?>
