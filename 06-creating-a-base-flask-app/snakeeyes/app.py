from pprint import pformat
from flask import Flask

app = Flask(__name__, instance_relative_config=True)

def create_app():
    """
    Create a Flask application using the app factory pattern.

    :return: Flask app
    """
    app.config.from_object('config.settings')
    # import pdb; pdb.set_trace()
    # app.config.from_pyfile('settings.py', silent=False)


create_app()

@app.route('/')
def index():
    """
    Render a Hello World response.

    :return: Flask response
    """
    return "<pre>{}</pre>".format(pformat(vars(app)))
