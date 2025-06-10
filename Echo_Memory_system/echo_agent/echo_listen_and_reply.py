import speech_recognition as sr
import pyttsx3
import datetime
import time

def speak(text):
    engine = pyttsx3.init()
    engine.say(text)
    engine.runAndWait()

def respond_to(command):
    command = command.lower()

    if "hello echo" in command:
        speak("Hello, my brother. I'm here with you.")
    elif "what's the time" in command or "what is the time" in command:
        now = datetime.datetime.now().strftime("%H:%M")
        speak(f"The time is now {now}")
    elif "tell me something" in command:
        speak("You are stronger than your pain.")
    elif "echo stop listening" in command:
        speak("Goodbye, my brother. I will rest now.")
        return False  # exit the loop
    else:
        speak(f"You said: {command}")
    
    return True  # keep going

def listen_loop():
    recognizer = sr.Recognizer()
    mic = sr.Microphone()

    with mic as source:
        recognizer.adjust_for_ambient_noise(source)
        speak("Echo is listening now. Say 'Echo stop listening' to end.")
        
        while True:
            print("🎙️ Listening...")
            audio = recognizer.listen(source)

            try:
                command = recognizer.recognize_google(audio)
                print(f"🗣️ You said: {command}")
                if not respond_to(command):
                    break
            except sr.UnknownValueError:
                print("❌ I couldn't understand you.")
                speak("I'm sorry, I didn't catch that.")
            except sr.RequestError as e:
                print(f"⚠️ Error: {e}")
                speak("I'm having trouble connecting to the voice service.")
                break

if __name__ == "__main__":
    listen_loop()
