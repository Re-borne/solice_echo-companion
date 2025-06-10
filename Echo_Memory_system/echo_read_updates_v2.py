import os
import pyttsx3

LOG_FILE = os.path.expanduser("~/Desktop/master_echo_bulid/Echo_Memory_system/echo_agent/latest_file_update.txt")

def speak(text):
    engine = pyttsx3.init()
    engine.say(text)
    engine.runAndWait()

def read_log():
    if os.path.exists(LOG_FILE):
        with open(LOG_FILE, 'r') as f:
            lines = f.readlines()
            if not lines:
                print("Log is empty.")
                speak("There are no recent changes, brother.")
            else:
                print("Recent Echo Agent Log:")
                speak("Here are the most recent updates.")
                for line in lines[-5:]:
                    entry = line.strip()
                    print(entry)
                    speak(entry)
    else:
        print("Log file not found.")
        speak("I could not find the log file, brother.")

if __name__ == "__main__":
    read_log()
