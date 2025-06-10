<?php
// 🧠 Echo – Phase 23: Memory Summary & Insights

// Tags Echo will track and reflect on
$tags_to_track = ['#hope', '#pain', '#peace', '#joy', '#strength', '#faith', '#grief', '#tired', '#healing'];
$tag_counts = [];

// Correct paths to memory files
$short_term = "../../Echo_Memory_system/core_memory/echo_memories.txt";
$soul_archive = "../../Echo_Memory_system/core_memory/echo_memories_archive.txt";

// Read and combine memory files
$memory_text = strtolower(file_get_contents($short_term) . "\n" . file_get_contents($soul_archive));

// Count tag appearances
foreach ($tags_to_track as $tag) {
    $count = substr_count($memory_text, strtolower($tag));
    if ($count > 0) {
        $tag_counts[$tag] = $count;
    }
}

// Sort by most common tags
arsort($tag_counts);

// Build summary sentence
$top_tag = key($tag_counts);
$summary = "";
if ($top_tag) {
    $summary = "Over recent memories, you've been focusing a lot on " . str_replace('#', '', $top_tag) . ".";
}
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Echo – Memory Summary</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      background: #f5faff;
      padding: 2rem;
      text-align: center;
    }
    h2 {
      color: #333;
      margin-bottom: 1rem;
    }
    .tag {
      font-size: 18px;
      margin: 0.3rem;
    }
    .summary {
      margin-top: 2rem;
      font-size: 20px;
      font-style: italic;
      color: #444;
    }
    .button {
      margin-top: 1.5rem;
      padding: 0.8rem 2rem;
      font-size: 16px;
      background: #dfefff;
      border: none;
      border-radius: 20px;
      cursor: pointer;
    }
  </style>
</head>
<body>
  <h2>👁️ Echo Eyes – Memory Summary</h2>

  <p>Here's what I’ve noticed from your recent memories:</p>

  <?php if (!empty($tag_counts)): ?>
    <div>
      <?php foreach ($tag_counts as $tag => $count): ?>
        <div class="tag">🔹 <strong><?php echo $tag; ?></strong>: <?php echo $count; ?> mentions</div>
      <?php endforeach; ?>
    </div>
    <div class="summary"><?php echo $summary; ?></div>
    <form method="post">
      <button class="button" name="speak" value="yes">🔊 Speak this aloud</button>
    </form>
  <?php else: ?>
    <p>No emotional tags found yet. Echo is ready to reflect when you are.</p>
  <?php endif; ?>

  <?php
  if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['speak']) && $_POST['speak'] === 'yes' && $summary) {
      echo "<script>window.speechSynthesis.speak(new SpeechSynthesisUtterance(" . json_encode($summary) . "));</script>";
  }
  ?>
</body>
</html>
