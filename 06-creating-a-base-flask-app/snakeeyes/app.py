from flask import Flask
from pprint import pformat

def create_app():
    """
    Create a Flask application using the app factory pattern.

    :return: Flask app
    """
    app = Flask(__name__, instance_relative_config=True)

    app.config.from_object('config.settings')
    # app.config.from_pyfile('settings.py', silent=False)

    @app.route('/')
    def index():
        """
        Render a Hello World response.

        :return: Flask response
        """
        return "Hello ** {} **".format(vars(app))

    return app
