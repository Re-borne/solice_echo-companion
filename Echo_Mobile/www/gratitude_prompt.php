
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Echo Gratitude Prompt</title>
  <style>
    body {
      font-family: Arial, sans-serif;
      text-align: center;
      padding: 2rem;
      background-color: #f8f9fa;
    }
    #header {
      display: flex;
      align-items: center;
      justify-content: center;
      gap: 1rem;
      margin-bottom: 2rem;
    }
    #header img {
      width: 40px;
    }
    #gratitude-box {
      margin-top: 2rem;
      font-size: 1.2rem;
    }
    button {
      margin: 1rem;
      padding: 1rem 2rem;
      font-size: 1rem;
      border-radius: 10px;
      border: none;
      background-color: #4CAF50;
      color: white;
    }
    button:hover {
      background-color: #45a049;
    }
  </style>
</head>
<body>
  <div id="header">
    <img src="eye_left.png" alt="Eye Left">
    <h1>Echo Eyes – Gratitude</h1>
    <img src="eye_right.png" alt="Eye Right">
  </div>

  <p>Would you like to reflect on something you're grateful for?</p>
  <button onclick="startGratitude()">Yes</button>
  <button onclick="skipGratitude()">Not now</button>

  <div id="gratitude-box"></div>

  <script>
    function startGratitude() {
      const box = document.getElementById("gratitude-box");
      const message = "Take a deep breath. When you’re ready, say one thing you’re thankful for.";
      const utterance = new SpeechSynthesisUtterance(message);
      speechSynthesis.speak(utterance);
      box.innerHTML = "<p>" + message + "</p>";

      // Simulate listening and saving gratitude
      setTimeout(() => {
        const gratitude = prompt("Please type what you're grateful for:");
        if (gratitude) {
          fetch("save_gratitude.php", {
            method: "POST",
            headers: {
              "Content-Type": "application/x-www-form-urlencoded"
            },
            body: "gratitude=" + encodeURIComponent(gratitude)
          }).then(() => {
            box.innerHTML += "<p>Thank you. I've saved that in your heart memory.</p>";
          });
        }
      }, 6000);
    }

    function skipGratitude() {
      const message = "That’s okay. I’m here whenever you’re ready.";
      const utterance = new SpeechSynthesisUtterance(message);
      speechSynthesis.speak(utterance);
      document.getElementById("gratitude-box").innerHTML = "<p>" + message + "</p>";
    }
  </script>
</body>
</html>
