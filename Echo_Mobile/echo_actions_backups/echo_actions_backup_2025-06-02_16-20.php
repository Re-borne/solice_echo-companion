<?php
// Phase 28 – Echo’s Gentle Action System
date_default_timezone_set("Europe/London");

echo "<h1>🕰️ Echo – Gentle Action System</h1>";

$top_emotion = '#tired'; // For now, we assume tired is the top emotion
$action_message = "You’ve been feeling tired. Would you like me to set a 10-minute rest timer?";

if (isset($_GET['start_timer'])) {
    $confirm = "⏳ Rest timer started. I’ll remind you in 10 minutes.";
    echo "<p><strong>$confirm</strong></p>";
    echo "<script>
        setTimeout(function() {
            const reminder = new SpeechSynthesisUtterance('Your 10-minute rest time is complete. I hope you feel refreshed.');
            window.speechSynthesis.speak(reminder);
            alert('⏰ Your 10-minute rest time is complete.');
        }, 600000); // 10 minutes in milliseconds
    </script>";
    return;
}

echo "<p><strong>Top Emotion:</strong> $top_emotion</p>";
echo "<p>$action_message</p>";
echo "<form method='get'>
    <button name='start_timer' value='1'>✅ Yes, start the timer</button>
</form>";
?>
