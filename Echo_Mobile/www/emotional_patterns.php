<?php
// Phase 24 – Emotional Pattern Recognition (Final Version)
date_default_timezone_set("Europe/London");

echo "<h1>📅 Emotional Pattern Summary</h1>";

$memory_files = [
    "/Users/danielcolyer/Desktop/master_echo_bulid/Echo_Memory_system/core_memory/echo_memories.txt",
    "/Users/danielcolyer/Desktop/master_echo_bulid/Echo_Memory_system/core_memory/echo_memories_archive.txt"
];

$tag_timeline = [];

foreach ($memory_files as $file) {
    echo "<p>Reading from: $file</p>";
    if (file_exists($file)) {
        $lines = file($file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        foreach ($lines as $line) {
            if (preg_match('/\\[(\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2})\\]/', $line, $ts_match)) {
                $timestamp = strtotime($ts_match[1]);
                if ($timestamp !== false) {
                    if (preg_match_all('/#\\w+/', $line, $tag_matches)) {
                        foreach ($tag_matches[0] as $tag) {
                            $tag_timeline[$tag][] = $timestamp;
                        }
                    }
                }
            }
        }
    } else {
        echo "<p>⚠️ File not found: $file</p>";
    }
}

function analyze_patterns($tag_timeline) {
    $results = [];
    foreach ($tag_timeline as $tag => $timestamps) {
        sort($timestamps);
        $count = count($timestamps);
        $gaps = [];
        for ($i = 1; $i < $count; $i++) {
            $gaps[] = ($timestamps[$i] - $timestamps[$i - 1]) / 86400;
        }
        $avg_gap = count($gaps) ? round(array_sum($gaps) / count($gaps), 2) : 0;
        $last_seen = date("Y-m-d", end($timestamps));
        $results[] = [
            "tag" => $tag,
            "count" => $count,
            "avg_days" => $avg_gap,
            "last_seen" => $last_seen
        ];
    }
    return $results;
}

$patterns = analyze_patterns($tag_timeline);

echo "<hr>";

if (empty($patterns)) {
    echo "<p>No emotional tags found yet.</p>";
} else {
    echo "<ul>";
    foreach ($patterns as $pattern) {
        echo "<li><strong>{$pattern['tag']}</strong> appeared {$pattern['count']} times, approx every {$pattern['avg_days']} days. Last seen: {$pattern['last_seen']}.</li>";
    }
    echo "</ul>";
}
?>
