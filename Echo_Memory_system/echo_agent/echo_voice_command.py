import pyttsx3
import speech_recognition as sr
import webbrowser
import datetime
from pathlib import Path  # ✅ Fix: import Path so file paths work

# Speak using pyttsx3
def speak(text):
    engine = pyttsx3.init()
    engine.say(text)
    engine.runAndWait()

# Listen for a voice command
def listen():
    recognizer = sr.Recognizer()
    with sr.Microphone() as source:
        print("Listening for a command...")
        speak("I'm listening")
        audio = recognizer.listen(source)

    try:
        command = recognizer.recognize_google(audio)
        print(f"You said: {command}")
        return command.lower()
    except sr.UnknownValueError:
        print("Sorry, I didn't understand that.")
        speak("Sorry, I didn't understand that.")
        return ""
    except sr.RequestError:
        print("Speech service is unavailable.")
        speak("Speech service is unavailable.")
        return ""

# Process the voice command
def process_command(command):
    if "take note" in command:
        speak("Opening Take Note page")
        webbrowser.open("file://" + str(Path("~/Desktop/master_echo_bulid/Echo_Mobile/www/take_note.html").expanduser()))
    elif "speak time" in command:
        now = datetime.datetime.now()
        current_time = now.strftime("%H:%M")
        speak(f"The time is {current_time}")
    elif "set reminder" in command:
        speak("Opening Set Reminder page")
        webbrowser.open("file://" + str(Path("~/Desktop/master_echo_bulid/Echo_Mobile/www/set_reminder.html").expanduser()))
    elif "set alarm" in command:
        speak("Opening Set Alarm page")
        webbrowser.open("file://" + str(Path("~/Desktop/master_echo_bulid/Echo_Mobile/www/set_alarm.html").expanduser()))
    elif "wisdom" in command:
        speak("Opening Wisdom page")
        webbrowser.open("file://" + str(Path("~/Desktop/master_echo_bulid/Echo_Mobile/www/wisdom.html").expanduser()))
    elif "read message" in command:
        speak("Opening Read Message page")
        webbrowser.open("file://" + str(Path("~/Desktop/master_echo_bulid/Echo_Mobile/www/read_message.html").expanduser()))
    elif "library" in command:
        speak("Opening Library page")
        webbrowser.open("file://" + str(Path("~/Desktop/master_echo_bulid/Echo_Mobile/www/library.html").expanduser()))
    else:
        speak("Command not recognized. Please try again.")

# Main
if __name__ == "__main__":
    command = listen()
    if command:
        process_command(command)
