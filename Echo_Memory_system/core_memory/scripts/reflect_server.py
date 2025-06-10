import http.server
import socketserver
import random
import pyttsx3

PORT = 3001
LOG_PATH = "/Users/danielcolyer/Desktop/Echo Memory System/core_memory/compressed_memory.log"

def get_reflection():
    try:
        with open(LOG_PATH, "r") as f:
            lines = [line.strip() for line in f if line.strip()]
        return random.choice(lines)
    except Exception as e:
        return "I could not access your reflections."

class ReflectHandler(http.server.SimpleHTTPRequestHandler):
    def do_GET(self):
        if self.path == "/reflect":
            reflection = get_reflection()
            self.send_response(200)
            self.send_header("Content-type", "text/plain")
            self.end_headers()
            self.wfile.write(reflection.encode())

            engine = pyttsx3.init()
            engine.say(reflection)
            engine.runAndWait()
        else:
            super().do_GET()

if __name__ == "__main__":
    with socketserver.TCPServer(("", PORT), ReflectHandler) as httpd:
        print(f"🌱 Echo Reflect server running on port {PORT}...")
        httpd.serve_forever()

