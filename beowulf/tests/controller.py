import unittest
from unittest.mock import MagicMock
import sys
sys.path.insert(0,'.')
from app import controller
import json

class View(object): pass
class Model(object): pass
class ControllerTests(unittest.TestCase):

    def test_correct_get_people(self):
        model = Model()
        model_result = [('dave',1.0)]
        model.getlogins = MagicMock(return_value=model_result)
        view = View()
        view_result = json.dumps({
            'people': [ { 'login' : 'dave', 'hours' : 1.0 } ]
        })
        view.render_people = MagicMock(return_value=view_result)
        beowulf = controller.Beowulf(model,view)
        test_app = beowulf.app.test_client()

        res = test_app.get('/get_people/coolproject')

        model.getlogins.assert_called_once_with('coolproject')
        view.render_people.assert_called_once_with(model_result)
        assert res.status_code == 200
        assert res.data == view_result.encode()
        assert 'application/json' in res.headers['Content-Type']

    def test_model_crash_on_get_people(self):
        model = Model()
        model_result = [('dave',1.0)]
        model.getlogins = MagicMock(side_effect=Exception)
        view = View()
        view_result = json.dumps({
            'errors': ['Something went wrong in the database.']
        })
        view.render_error = MagicMock(return_value=view_result)
        beowulf = controller.Beowulf(model,view)
        test_app = beowulf.app.test_client()

        res = test_app.get('/get_people/coolproject')
        assert res.status_code == 500
        assert res.data == view_result.encode()
        assert 'application/json' in res.headers['Content-Type']

    def test_correct_get_projects(self):
        model = Model()
        model_result = [('project1',1.0)]
        model.getprojectnumbers = MagicMock(return_value=model_result)
        view = View()
        view_result = json.dumps({
            'projects': [ { 'project_number' : 'project1', 'hours' : 1.0 } ]
        })
        view.render_projects = MagicMock(return_value=view_result)
        beowulf = controller.Beowulf(model,view)
        test_app = beowulf.app.test_client()

        res = test_app.get('/get_projects/cooldude')

        model.getprojectnumbers.assert_called_once_with('cooldude')
        view.render_projects.assert_called_once_with(model_result)
        assert res.status_code == 200
        assert res.data == view_result.encode()
        assert 'application/json' in res.headers['Content-Type']

    def test_model_crash_on_get_projects(self):
        model = Model()
        model.getusers = MagicMock(side_effect=Exception)
        view = View()
        view_result = json.dumps({
            'errors': ['Something went wrong in the database.']
        })
        view.render_error = MagicMock(return_value=view_result)
        beowulf = controller.Beowulf(model,view)
        test_app = beowulf.app.test_client()

        res = test_app.get('/get_projects/cooldude')
        assert res.status_code == 500
        assert res.data == view_result.encode()
        assert 'application/json' in res.headers['Content-Type']


if __name__ == '__main__': unittest.main()
