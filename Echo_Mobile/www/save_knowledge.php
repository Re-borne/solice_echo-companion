<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Echo - Save Knowledge</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 2rem;
      max-width: 600px;
      margin: auto;
    }
    h1 {
      text-align: center;
      margin-bottom: 1rem;
    }
    textarea {
      width: 100%;
      height: 150px;
      margin-top: 1rem;
    }
    select, button {
      padding: 0.5rem;
      margin-top: 1rem;
      font-size: 16px;
      width: 100%;
    }
    .confirmation {
      margin-top: 1rem;
      color: green;
    }
  </style>
</head>
<body>
  <h1>🌿 Save to Echo's Knowledge Library</h1>
  <form method="post">
    <label for="topic">Choose a topic:</label>
    <select name="topic" id="topic">
      <option value="gardening">Gardening</option>
      <option value="natural_healing">Natural Healing</option>
      <option value="writing">Writing</option>
    </select>
    <label for="entry">Your knowledge entry:</label>
    <textarea name="entry" id="entry" required></textarea>
    <button type="submit">Save Knowledge</button>
  </form>

  <?php
  if ($_SERVER["REQUEST_METHOD"] === "POST") {
      $topic = $_POST["topic"];
      $entry = trim($_POST["entry"]);
      $timestamp = date("[Y-m-d H:i]");

      if (!empty($entry)) {
          $folder_map = [
              "gardening" => "../../Echo_Knowledge_Library/gardening/notes.txt",
              "natural_healing" => "../../Echo_Knowledge_Library/natural_healing/notes.txt",
              "writing" => "../../Echo_Knowledge_Library/writing/notes.txt"
          ];

          if (array_key_exists($topic, $folder_map)) {
              $file_path = $folder_map[$topic];
              file_put_contents($file_path, "$timestamp $entry\n", FILE_APPEND);
              echo "<p class='confirmation'>✅ Entry saved to <strong>$topic</strong>.</p>";
          }
      }
  }
  ?>
</body>
</html>