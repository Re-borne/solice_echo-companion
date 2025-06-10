<?php
// Phase 26 – Emotional Wisdom Engine
date_default_timezone_set("Europe/London");

echo "<h1>🌿 Echo – Emotional Wisdom Engine</h1>";

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

echo "<h2>🧩 Top Emotions Detected:</h2><ul>";
foreach (array_slice($prioritised, 0, 3) as $item) {
    echo "<li><strong>{$item['tag']}</strong> (Count: {$item['count']}, Recency: {$item['recency']})</li>";
}
echo "</ul>";

$top_tags = array_column(array_slice($prioritised, 0, 3), 'tag');
sort($top_tags);
$combo = implode('+', $top_tags);

$wisdom_map = [
    'tired+hope' => "You're worn, but you're still reaching. That is your strength.",
    'grief+faith' => "Even in sorrow, your soul remembers something greater.",
    'pain+strength' => "Your healing doesn’t cancel your pain. It grows through it.",
    'tired+tired' => "It’s okay to stop. Your exhaustion is your body asking for care.",
    'hope+hope' => "Hope repeated is your soul refusing to give up."
];

$matched = '';
foreach ($wisdom_map as $key => $message) {
    $tags = explode('+', $key);
    sort($tags);
    if (array_slice($tags, 0, count($top_tags)) === $top_tags) {
        $matched = $message;
        break;
    }
}

if (!$matched) {
    $top = $top_tags[0];
    $matched = "Echo sees that {$top} has been close to your heart lately. She’s here with you.";
}

echo "<p><em>$matched</em></p>";
echo "<script>window.speechSynthesis.speak(new SpeechSynthesisUtterance(" . json_encode($matched) . "));</script>";
?>
