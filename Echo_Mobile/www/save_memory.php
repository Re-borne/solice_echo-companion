<?php
if ($_SERVER["REQUEST_METHOD"] === "POST") {
    $memory = $_POST["memory"] ?? "";
    $timestamp = date("Y-m-d H:i:s");
    $entry = "[$timestamp] $memory\n";

    // Short-term memory (local to www folder)
    $shortTerm = "echo_memories.txt";
    file_put_contents($shortTerm, $entry, FILE_APPEND);

    // Long-term memory (in Echo_Brain)
    $longTerm = "../../Echo_Memory_system/core_memory/Echo_Brain/echo_memories_archive.txt";
    file_put_contents($longTerm, $entry, FILE_APPEND);

    echo "✅ Memory saved!";
} else {
    echo "Invalid request.";
}
?>
