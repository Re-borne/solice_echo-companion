import pyttsx3
import speech_recognition as sr

engine = pyttsx3.init()
engine.setProperty('rate', 150)

def speak(text):
    engine.say(text)
    engine.runAndWait()

def listen_command():
    recognizer = sr.Recognizer()
    with sr.Microphone() as source:
        speak("I am listening, brother.")
        audio = recognizer.listen(source)
    try:
        command = recognizer.recognize_google(audio).lower()
        print(f"You said: {command}")
        return command
    except sr.UnknownValueError:
        speak("Sorry, I did not understand that.")
        return ""
    except sr.RequestError:
        speak("Speech service is unavailable right now.")
        return ""

def run_command(command):
    if "backup" in command:
        speak("Starting backup now.")
        # Call your backup function here
        # For example: backup_echo()
    elif "read" in command:
        speak("Ready to read a file.")
        # Trigger your read file function
    elif "search" in command:
        speak("Starting search.")
        # Trigger your search function
    else:
        speak("I am not sure how to do that yet.")

def main():
    while True:
        command = listen_command()
        if command:
            run_command(command)
        # Add a way to break loop if you want, e.g., "stop listening"

if __name__ == "__main__":
    main()
