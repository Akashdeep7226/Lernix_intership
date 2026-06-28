from http.server import HTTPServer, BaseHTTPRequestHandler

class Handler(BaseHTTPRequestHandler):
  def do_GET(self):
    self.send_response(200)
    self.end_headers()
    self.wfile.write(b"Learnix Labs Devops Task2 Runnung")
server = HTTPServer(("0.0.0.0" , 5001), Handler)
server.serve_forever()
