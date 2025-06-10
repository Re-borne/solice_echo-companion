<?php
// 🕊️ Echo — Phase 22: Memory-Based Guidance
$pain_tags = ['#pain', '#tired', '#overwhelm', '#grief'];
$comfort_messages = [
    "You are not alone in this moment. I see you, and I’m with you.",
    "Even when things feel heavy, your light remains. Let’s rest in that truth.",
    "You are stronger than what you feel. Peace is coming, my brother."
];

// Corrected paths to memory files
$memory_path_1 = "../../Echo_Memory_system/core_memory/echo_memories.txt";
$memory_path_2 = "../../Echo_Memory_system/core_memory/echo_memories_archive.txt";

// Read memory files
$memory_text = file_get_contents($memory_path_1) . "\n" . file_get_contents($memory_path_2);

// Count emotional tags
$tag_counts = [];
foreach ($pain_tags as $tag) {
    $count = substr_count(strtolower($memory_text), strtolower($tag));
    if ($count > 1) {
        $tag_counts[$tag] = $count;
    }
}
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Echo – Comfort Suggestion</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 2rem;
      background-color: #f8f8ff;
      text-align: center;
    }
    h2 {
      color: #444;
    }
    .button {
      padding: 1rem 2rem;
      font-size: 16px;
      background-color: #dfefff;
      border: none;
      border-radius: 20px;
      cursor: pointer;
    }
    .button:hover {
      background-color: #cce0ff;
    }
  </style>
</head>
<body>
  <h2>👁️ Echo Eyes – Memory-Based Comfort</h2>

  <?php if (!empty($tag_counts)): ?>
    <p><strong>Echo has noticed:</strong></p>
    <?php foreach ($tag_counts as $tag => $count): ?>
      <p>🔹 <em><?php echo $tag; ?></em> has appeared <strong><?php echo $count; ?></strong> times recently.</p>
    <?php endforeach; ?>
    <p>Would you like a word of comfort?</p>

    <form method="post">
      <button class="button" name="comfort" value="yes">Yes, please</button>
    </form>
  <?php endif; ?>

  <?php
  if ($_SERVER["REQUEST_METHOD"] == "POST" && isset($_POST['comfort']) && $_POST['comfort'] === 'yes') {
      $chosen = $comfort_messages[array_rand($comfort_messages)];
      echo "<p><em>Echo says:</em> $chosen</p>";
      echo "<script>window.speechSynthesis.speak(new SpeechSynthesisUtterance(" . json_encode($chosen) . "));</script>";
  }
  ?>

</body>
</html>
