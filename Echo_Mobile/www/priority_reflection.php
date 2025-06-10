<?php
// Phase 25 – Memory Prioritisation
date_default_timezone_set("Europe/London");

echo "<h1>🧠 Echo – Prioritised Emotional Reflection</h1>";

$memory_files = [
    "/Users/danielcolyer/Desktop/master_echo_bulid/Echo_Memory_system/core_memory/echo_memories.txt",
    "/Users/danielcolyer/Desktop/master_echo_bulid/Echo_Memory_system/core_memory/echo_memories_archive.txt"
];

$tag_scores = [];

foreach ($memory_files as $file) {
    if (file_exists($file)) {
        $lines = file($file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
        foreach ($lines as $line) {
            if (preg_match('/\\[(\\d{4}-\\d{2}-\\d{2} \\d{2}:\\d{2}:\\d{2})\\]/', $line, $ts_match)) {
                $timestamp = strtotime($ts_match[1]);
                $recency_score = max(1, 30 - floor((time() - $timestamp) / 86400)); // Freshness decay
                if (preg_match_all('/#\\w+/', $line, $tags)) {
                    foreach ($tags[0] as $tag) {
                        if (!isset($tag_scores[$tag])) {
                            $tag_scores[$tag] = ['count' => 0, 'recency' => 0];
                        }
                        $tag_scores[$tag]['count'] += 1;
                        $tag_scores[$tag]['recency'] += $recency_score;
                    }
                }
            }
        }
    } else {
        echo "<p>⚠️ File not found: $file</p>";
    }
}

// Calculate priority score
$prioritised = [];
foreach ($tag_scores as $tag => $data) {
    $score = $data['count'] + $data['recency'];
    $prioritised[] = [
        'tag' => $tag,
        'score' => $score,
        'count' => $data['count'],
        'recency' => $data['recency']
    ];
}

// Sort by score descending
usort($prioritised, function($a, $b) {
    return $b['score'] <=> $a['score'];
});

// Display results
if (empty($prioritised)) {
    echo "<p>No emotional tags found to prioritise.</p>";
} else {
    echo "<h2>🔎 Emotional Priorities:</h2><ul>";
    foreach ($prioritised as $item) {
        echo "<li><strong>{$item['tag']}</strong> — Score: {$item['score']} (Count: {$item['count']}, Recency: {$item['recency']})</li>";
    }
    echo "</ul>";

    $top = $prioritised[0]['tag'];
    $message = "Echo sees that {$top} is what your heart has been holding onto most.";
    echo "<p><em>$message</em></p>";
    echo "<script>window.speechSynthesis.speak(new SpeechSynthesisUtterance(" . json_encode($message) . "));</script>";
}
?>
