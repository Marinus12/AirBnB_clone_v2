#!/usr/bin/python3
"""Script that starts a Flask web application."""

from flask import Flask
from models import storage
from models.state import State

app = Flask(__name__)


@app.teardown_appcontext
def teardown_db(exception):
    """Teardown method to remove SQLAlchemy Session"""
    storage.close()


@app.route('/states', strict_slashes=False)
def status_list():
    """DIsplays a HTML page listing all State objects."""
    state = storage.all(State).values()
    sorted_states = sorted(state, key=lambda state: state.name)
    return render_template('9-states.html', states=sorted_states)


@app.route('/states/<id>', strict_slashes=False)
def cities_of_states(id):
    """Display a HTML page listening all City objects linked to a State"""
    state = storage.get(State, id)
    if state:
        cities = sorted(state.cities, key=lambda city: city.name)
        return render_template('9-states.html', state=state, cities=cities)
    else:
        return render_template('9-states.html', not_found=True)


if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000)
