import os
from flask import Flask, Response

class Beowulf(object):
    def __init__(self, model,view):
        self.app = Flask(__name__)
        self.model = model
        self.view = view

        @self.app.route('/get_people/<project_number>')
        def get_people(project_number):
            json = None
            status_code = 200
            try:
                rows = self.model.getlogins( project_number )
            except Exception:
                json = self.view.render_error()
                status_code = 500
            json = json or self.view.render_people( rows )
            response = Response(json, mimetype='application/json')
            response.headers['Access-Control-Allow-Origin'] = '*'
            response.status_code = status_code
            return response

        @self.app.route('/get_projects/<login>')
        def get_projects(login):
            json = None
            status_code = 200
            try:
                rows = self.model.getprojectnumbers( login )
            except Exception:
                json = self.view.render_error()
                status_code = 500
            json = json or self.view.render_projects( rows )
            response = Response(json, mimetype='application/json')
            response.headers['Access-Control-Allow-Origin'] = '*'
            response.status_code = status_code
            return response


    def run(self):
        DEBUG = 'debug' in os.environ
        PORT = int(os.environ['PORT'])
        self.app.run(host='0.0.0.0',debug=DEBUG,port=PORT)

