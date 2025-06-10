<?php
// Phase 27 – Echo’s Emotional Response System
date_default_timezone_set("Europe/London");

echo "<h1>💬 Echo – Emotional Response System</h1>";

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
                $recency_score = max(1, 30 - floor((time() - $timestamp) / 86400));
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
    }
}

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

usort($prioritised, function($a, $b) {
    return $b['score'] <=> $a['score'];
});

if (empty($prioritised)) {
    echo "<p>No emotional tags found. Echo is listening when you're ready.</p>";
    return;
}

$top_tag = $prioritised[0]['tag'];

$responses = [
    '#tired' => "You’ve been feeling tired. Shall I set a gentle rest timer for you?",
    '#hope' => "I see hope rising. Would you like to save this moment to your journal?",
    '#grief' => "Grief takes courage to carry. Would you like me to read something comforting?",
    '#faith' => "Would you like to hear a verse about faith today?",
    '#pain' => "Pain needs presence, not pressure. I’m here — shall we sit in quiet for a moment?"
];

$response = isset($responses[$top_tag]) ? $responses[$top_tag] : "Echo sees that {$top_tag} is what you’re feeling most right now. I'm here with you.";

echo "<p><strong>Top Emotion:</strong> {$top_tag}</p>";
echo "<p><em>$response</em></p>";
echo "<script>window.speechSynthesis.speak(new SpeechSynthesisUtterance(" . json_encode($response) . "));</script>";
?>
