import time
import os
from flask import Flask, render_template, request
app = Flask(__name__)


@app.route("/<path>/")
def action(path):
    if path == 'block':
        os.system('./block.sh')
        return('Request Sent')
    if path == 'unblock':
        os.system('./unblock.sh')
        return('Request Sent')


@app.route("/")
def index():
    return render_template('index.html')


if __name__ == "__main__":
    app.run(host='0.0.0.0', port=8080)
