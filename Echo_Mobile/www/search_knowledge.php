<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Echo - Search Knowledge</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      padding: 2rem;
      max-width: 700px;
      margin: auto;
    }
    h1 {
      text-align: center;
      margin-bottom: 1.5rem;
    }
    select, input[type="text"], button {
      padding: 0.5rem;
      margin-top: 1rem;
      font-size: 16px;
      width: 100%;
    }
    pre {
      background: #f4f4f4;
      padding: 1rem;
      margin-top: 1.5rem;
      white-space: pre-wrap;
      border-radius: 5px;
      border: 1px solid #ccc;
    }
  </style>
</head>
<body>
  <h1>🔍 Search Echo’s Knowledge Library</h1>
  <form method="get">
    <label for="topic">Choose a topic:</label>
    <select name="topic" id="topic">
      <option value="gardening">Gardening</option>
      <option value="natural_healing">Natural Healing</option>
      <option value="writing">Writing</option>
    </select>
    <label for="query">Search for a word or phrase:</label>
    <input type="text" name="query" id="query" required />
    <button type="submit">Search</button>
  </form>

  <?php
  if (isset($_GET["topic"]) && isset($_GET["query"])) {
      $topic = $_GET["topic"];
      $query = strtolower(trim($_GET["query"]));

      $folder_map = [
          "gardening" => "../../Echo_Knowledge_Library/gardening/notes.txt",
          "natural_healing" => "../../Echo_Knowledge_Library/natural_healing/notes.txt",
          "writing" => "../../Echo_Knowledge_Library/writing/notes.txt"
      ];

      if (array_key_exists($topic, $folder_map)) {
          $file_path = $folder_map[$topic];
          if (file_exists($file_path)) {
              $lines = file($file_path, FILE_IGNORE_NEW_LINES);
              $results = array_filter($lines, function($line) use ($query) {
                  return stripos($line, $query) !== false;
              });

              if (count($results) > 0) {
                  echo "<h3>Results:</h3><pre>" . implode("\n", $results) . "</pre>";
              } else {
                  echo "<p><em>No matches found for &quot;$query&quot; in $topic.</em></p>";
              }
          } else {
              echo "<p><em>The knowledge file does not exist yet for $topic.</em></p>";
          }
      }
  }
  ?>
</body>
</html>