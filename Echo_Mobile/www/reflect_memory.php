<?php
// ✅ Set the correct path to the memory file
$memoryFile = "/Users/danielcolyer/Desktop/master_echo_build/Echo_Memory_system/core_memory/Echo_Brain/Core_Memories/latest_reflection.txt";

// ✅ Check if the file exists
if (file_exists($memoryFile)) {
    $content = file_get_contents($memoryFile);
    echo trim($content);
} else {
    echo "There is no memory reflection available at the moment.";
}
?>
