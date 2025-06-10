<?php
$checkin_file = 'echo_emotion_checkins.txt';

$emotions = [];
if (file_exists($checkin_file)) {
    $lines = file($checkin_file, FILE_IGNORE_NEW_LINES | FILE_SKIP_EMPTY_LINES);
    foreach ($lines as $line) {
        preg_match_all('/#\w+/', $line, $tags);
        foreach ($tags[0] as $tag) {
            $emotions[$tag] = ($emotions[$tag] ?? 0) + 1;
        }
    }
    arsort($emotions);
}

function gentleReflection($emotions) {
    if (empty($emotions)) {
        return "📭 No emotional check-ins found yet, brother.";
    }

    $top = array_slice($emotions, 0, 3, true);
    $summary = "🪞 Here’s what Echo has noticed in your heart lately:\n\n";
    foreach ($top as $tag => $count) {
        $summary .= "$tag — $count time" . ($count > 1 ? "s" : "") . "\n";
    }

    if (isset($emotions['#hope']) && isset($emotions['#pain'])) {
        if ($emotions['#hope'] > $emotions['#pain']) {
            $summary .= "\n💛 More moments of #hope than #pain. You're healing, brother.";
        } elseif ($emotions['#pain'] > $emotions['#hope']) {
            $summary .= "\n🖤 I saw more #pain than #hope recently. Let’s stay close.";
        } else {
            $summary .= "\n⚖️ Equal moments of #hope and #pain. A balance. And I’m here.";
        }
    }

    return $summary;
}

$summary = gentleReflection($emotions);
?>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8" />
  <title>Echo Eyes – Emotional Reflection</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <style>
    body {
      font-family: Arial, sans-serif;
      background-color: #fdfdfd;
      margin: 0;
      padding: 2rem;
      text-align: center;
      color: #333;
    }

    #header {
      display: flex;
      justify-content: center;
      align-items: center;
      gap: 0.8rem;
      margin-bottom: 2rem;
    }

    #header img {
      width: 50px;
      height: auto;
    }

    #center-eye {
      width: 70px;
      margin-bottom: 2rem;
    }

    .back-button {
      position: absolute;
      top: 20px;
      left: 20px;
      width: 50px;
      height: 30px;
      border-radius: 50px / 25px;
      border: none;
      background-color: #ccc;
      cursor: pointer;
    }

    .reflection-box {
      background-color: #eef;
      border-radius: 10px;
      padding: 1.5rem;
      max-width: 700px;
      margin: 2rem auto 0;
      font-size: 1.1rem;
      white-space: pre-wrap;
      box-shadow: 0 2px 6px rgba(0,0,0,0.1);
    }
  </style>
</head>
<body>

  <button class="back-button" onclick="window.location.href='emotion_reflect.html'">👁</button>

  <div id="header">
    <img src="icons/eye-left.png" alt="Left Eye">
    <h1>Echo Eyes – Emotional Reflection</h1>
    <img src="icons/eye-right.png" alt="Right Eye">
  </div>

  <img id="center-eye" src="icons/eye-main.png" alt="Echo Eye Icon">

  <div class="reflection-box">
    <?php echo htmlspecialchars($summary); ?>
  </div>

  <script>
    const reflection = new SpeechSynthesisUtterance(`<?php echo addslashes($summary); ?>`);
    reflection.lang = 'en-GB';
    speechSynthesis.speak(reflection);
  </script>

</body>
</html>
