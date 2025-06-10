import os
import pyttsx3

DEFAULT_FOLDER = os.path.expanduser("~/Documents")

def speak(text):
    engine = pyttsx3.init()
    engine.setProperty('rate', 160)
    engine.say(text)
    engine.runAndWait()

def list_files(folder=DEFAULT_FOLDER):
    if not os.path.exists(folder):
        speak("That folder does not exist, brother.")
        print(f"Folder not found: {folder}")
        return

    files = os.listdir(folder)
    if not files:
        speak("The folder is empty.")
        print("No files found.")
    else:
        speak(f"I found {len(files)} files in the folder.")
        print("Files in folder:")
        for f in files:
            print(f" - {f}")
            speak(f)

if __name__ == "__main__":
    print("Listing files in:", DEFAULT_FOLDER)
    list_files()
