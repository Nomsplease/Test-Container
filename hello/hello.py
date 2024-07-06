from datetime import datetime

from flask import Flask

app = Flask(__name__)

@app.route("/")
def hello_world():
    return f"Hello, World! The current date is: {datetime.now()}"