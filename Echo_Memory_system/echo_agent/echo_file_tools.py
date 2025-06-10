import pyttsx3
import speech_recognition as sr
import os
from echo_file_tools import read_file, search_folder, summarize_file

# Setup voice engine
engine = pyttsx3.init()
engine.setProperty('rate', 160)

def speak(text):
    print("Echo:", text)
    engine.say(text)
    engine.runAndWait()

def listen():
    recognizer = sr.Recognizer()
    with sr.Microphone() as source:
        speak("Listening...")
        audio = recognizer.listen(source)
    try:
        command = recognizer.recognize_google(audio)
        return command.lower()
    except sr.UnknownValueError:
        speak("Sorry, I didn't catch that.")
        return ""
    except sr.RequestError:
        speak("Could not connect to speech service.")
        return ""

def voice_loop():
    speak("Hello Reborne, I am ready. You can say read file, search folder, or summarize file.")

    while True:
        command = listen()
        
        if "read" in command:
            speak("Please say the full file path.")
            filepath = listen()
            speak("Reading file...")
            read_file(filepath)
        
        elif "search" in command:
            speak("Please say the folder name to search in.")
            folder = listen()
            speak("Searching...")
            search_folder(folder)
        
        elif "summarize" in command:
            speak("Please say the full file path to summarize.")
            filepath = listen()
            speak("Summarizing file...")
            summarize_file(filepath)

        elif "stop" in command or "exit" in command:
            speak("Goodbye Reborne. I’ll be here when you need me.")
            break

        elif command != "":
            speak("I didn’t understand. Please say read file, search folder, summarize file, or stop.")

# Run Echo’s voice loop
if __name__ == "__main__":
    voice_loop()
