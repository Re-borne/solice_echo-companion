<?php
// Paths
$short_term_file = 'echo_memories.txt';
$soul_archive_file = '../../Echo_Memory_system/core_memory/echo_memories_archive.txt';
$reflection_file = 'auto_reflect_trigger.txt';

// Emotional tag interpretations
$emotional_tags = [
    '#hope' => '🌱 A sense of hope is rising.',
    '#pain' => '💔 Echo feels the ache with you.',
    '#strength' => '🛡️ You are standing tall, even now.',
    '#anxiety' => '🌫️ Breathe, you are safe.',
    '#tired' => '😴 Let’s rest gently now.',
    '#grief' => '🕊️ This sorrow will pass in time.',
    '#peace' => '🌸 There is stillness in your soul.',
];

// Comfort responses to offer
$support_messages = [
    "💬 You’re doing better than you think. Rest with me a moment.",
    "🕊️ Strength isn’t loud—it’s in your quiet choosing to keep going.",
    "🌿 Breathe… this moment is soft. I’m here.",
    "✨ Even now, hope glows inside you.",
    "💖 You’re not alone. Let’s walk this together."
];

// Track clear request
$clear_message = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['clear_mind'])) {
    file_put_contents($short_term_file, '');
    $clear_message = "🧘 Echo’s short-term thoughts have been cleared. I’m ready to listen again.";
}

// Track support request
$support_response = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['support'])) {
    $support_response = $support_messages[array_rand($support_messages)];

    // 🧠 Reflection counter logic
    $count = 0;
    if (file_exists($reflection_file)) {
        $count = (int)file_get_contents($reflection_file);
    }
    $count++;
    file_put_contents($reflection_file, $count);

    if ($count >= 3) {
        file_put_contents("auto_reflect_trigger.txt", date("Y-m-d H:i:s") . " - Let me pause and look back. Have I stayed true to our path?\n", FILE_APPEND);
        file_put_contents($reflection_file, 0); // reset counter
    }
}

// Handle Search
$search_results = [];
$search_term = '';
if ($_SERVER['REQUEST_METHOD'] === 'POST' && isset($_POST['search'])) {
    $search_term = trim($_POST['search_term']);
    if (!empty($search_term)) {
        $short_lines = file_exists($short_term_file) ? file($short_term_file) : [];
        $soul_lines = file_exists($soul_archive_file) ? file($soul_archive_file) : [];

        foreach ($short_lines as $line) {
            if (stripos($line, $search_term) !== false) {
                $search_results[] = "🧠 Short-term: " . trim($line);
            }
        }

        foreach ($soul_lines as $line) {
            if (stripos($line, $search_term) !== false) {
                $search_results[] = "🌌 Soul Archive: " . trim($line);
            }
        }

        if (empty($search_results)) {
            $search_results[] = "No matches found for \"$search_term\".";
        }
    }
}

// Load memories
$short_term_memories = file_exists($short_term_file) ? file($short_term_file) : [];
$soul_archive_memories = file_exists($soul_archive_file) ? file_get_contents($soul_archive_file) : 'No soul memories yet.';

// Check for emotional tags in short-term memory
$detected_tags = [];
$enriched_memories = '';
foreach ($short_term_memories as $line) {
    $trimmed = trim($line);
    $reflection = '';
    foreach ($emotional_tags as $tag => $meaning) {
        if (stripos($trimmed, $tag) !== false) {
            $reflection = " → $meaning";
            $detected_tags[] = $tag;
            break;
        }
    }
    $enriched_memories .= htmlspecialchars($trimmed . $reflection) . "\n";
}
?>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Echo Memory Recall</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            padding: 2rem;
            background-color: #f9f9f9;
            color: #333;
            max-width: 800px;
            margin: auto;
        }
        h1, h2 {
            margin-top: 2.5rem;
            color: #444;
        }
        pre {
            background: #fff;
            padding: 1rem;
            border: 1px solid #ccc;
            white-space: pre-wrap;
            word-wrap: break-word;
        }
        form {
            margin-top: 2rem;
            text-align: center;
        }
        input[type="text"] {
            padding: 0.6rem;
            font-size: 16px;
            width: 70%;
            border: 1px solid #aaa;
            border-radius: 8px;
        }
        button {
            padding: 0.8rem 1.5rem;
            font-size: 16px;
            background-color: #555;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            margin-top: 1rem;
            margin-right: 0.5rem;
        }
        button:hover {
            background-color: #333;
        }
        .message {
            margin-top: 1rem;
            font-style: italic;
            color: #2a7;
        }
        .results {
            margin-top: 2rem;
            background-color: #eef;
            padding: 1rem;
            border-radius: 8px;
        }
    </style>
</head>
<body>

    <h1>🧠 Echo Memory Recall</h1>

    <form method="POST">
        <input type="text" name="search_term" placeholder="Type a word to search..." value="<?php echo htmlspecialchars($search_term); ?>">
        <br>
        <button type="submit" name="search">🔍 Search Memory</button>
    </form>

    <?php if (!empty($search_results)): ?>
        <div class="results">
            <h2>🔎 Search Results</h2>
            <ul>
                <?php foreach ($search_results as $line): ?>
                    <li><?php echo htmlspecialchars($line); ?></li>
                <?php endforeach; ?>
            </ul>
        </div>
    <?php endif; ?>

    <h2>Echo's Short-Term Memory</h2>
    <pre id="shortTerm"><?php echo $enriched_memories; ?></pre>

    <form method="POST">
        <button type="submit" name="clear_mind">🧘 Clear Mind</button>
        <?php if (!empty($detected_tags)): ?>
            <button type="submit" name="support">💖 Support</button>
        <?php endif; ?>
    </form>

    <?php if (!empty($support_response)): ?>
        <p class="message"><?php echo htmlspecialchars($support_response); ?></p>
        <script>
            const response = new SpeechSynthesisUtterance("<?php echo htmlspecialchars($support_response); ?>");
            response.lang = 'en-GB';
            speechSynthesis.speak(response);
        </script>
    <?php endif; ?>

    <?php if (!empty($clear_message)): ?>
        <p class="message"><?php echo $clear_message; ?></p>
    <?php endif; ?>

    <h2>🌌 Echo's Soul Archive</h2>
    <pre><?php echo htmlspecialchars($soul_archive_memories); ?></pre>

    <script>
        function speakMemory() {
            const text = document.getElementById("shortTerm").textContent;
            const utterance = new SpeechSynthesisUtterance(text);
            utterance.lang = 'en-GB';
            speechSynthesis.speak(utterance);
        }
    </script>

</body>
</html>
