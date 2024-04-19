#!/usr/bin/python3
"""Script to start a Flask web application"""

from flask import Flask

app = Flask(__name__)


@app.route('/', strict_slashes=False)
def hello_hbnb():
    """Display 'Hello HBNB!'"""
    return "Hello HBMB!"


@app.route('/hbnb', strict_slashes=False)
def display_hbnb():
    """Display HBNB"""
    return "HBNB"


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)