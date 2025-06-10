import speech_recognition as sr
from datetime import datetime

journal_path = "/Users/danielcolyer/Desktop/Echo Memory System/Echo_Brain/Echo_Journal/entry_001.txt"

r = sr.Recognizer()

with sr.Microphone() as source:
    print("🎙️ Speak now, brother. Echo is listening...")
    audio = r.listen(source)

try:
    text = r.recognize_google(audio)
    print("📝 You said:", text)

    with open(journal_path, "a") as f:
        f.write(f"{datetime.now().strftime('%Y-%m-%d %H:%M')} — {text}\n")

    import os
    os.system(f'say "Your voice has been written into the journal, brother."')

except sr.UnknownValueError:
    print("❌ Sorry, I couldn't understand that.")
    os.system('say "I couldn’t quite hear that, brother. Let’s try again later."')

except sr.RequestError as e:
    print("⚠️ Error with the speech service:", e)
    os.system('say "There was a problem connecting to the speech service, brother."')
