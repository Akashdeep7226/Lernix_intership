from http.server import HTTPServer, BaseHTTPRequestHandler
from datetime import datetime
import os

LOG_FILE ="logs/app.log"
VISIT_FILE = "data/visits.txt"

os.makedirs("logs", exist_ok= True)
os.makedirs("data", exist_ok= True)

class Handler (BaseHTTPRequestHandler):
    def do_GET(self):
        try:
            with open(VISIT_FILE,"r") as f:
                visits = int(f.read().strip())
        except:
            visits = 0
        visits+=1

        with open(VISIT_FILE,"w") as f:
            f.write(str(visits))
        with open(LOG_FILE,"a") as f:
            f.write(f"{datetime.now()} -GET / -Visit #{visits}\n")                
        self.send_response(200)
        self.end_headers()
        self.wfile.write(f"Learnix Labs DevOps Takk3 Running\n Total Visits: {visits} ".encode())
server = HTTPServer(("0.0.0.0",5001),Handler)    
server.serve_forever()