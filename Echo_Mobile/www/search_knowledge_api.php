<?php
header('Content-Type: text/plain');

// New root path with subfolders
$rootPath = '/Users/danielcolyer/Desktop/master_echo_bulid/Echo_Knowledge_Library';

$query = isset($_GET['query']) ? strtolower(trim($_GET['query'])) : '';

if (!$query) {
    echo "❌ No query provided.";
    exit;
}

function findTxtFilesRecursively($folder) {
    $txtFiles = [];
    $iterator = new RecursiveIteratorIterator(new RecursiveDirectoryIterator($folder));
    foreach ($iterator as $file) {
        if ($file->isFile() && strtolower($file->getExtension()) === 'txt') {
            $txtFiles[] = $file->getPathname();
        }
    }
    return $txtFiles;
}

$results = [];
$files = findTxtFilesRecursively($rootPath);

foreach ($files as $file) {
    $lines = file($file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        if (stripos($line, $query) !== false) {
            $results[] = "📄 " . basename($file) . ":\n" . trim($line);
        }
    }
}

if (empty($results)) {
    echo "No results found for: \"$query\".";
} else {
    echo "🔎 Results for \"$query\":\n\n" . implode("\n\n", $results);
}
