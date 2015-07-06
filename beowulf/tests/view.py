import unittest
import sys
sys.path.insert(0,'.')
from app import view
import json

class ViewTests(unittest.TestCase):
    def setUp(self): pass
    def tearDown(self): pass

    def test_render_people(self):
        rows = [ ('dave',0)
               , ('fred',1)
               ]
        dikt = {
            'people' : {
                'dave' : 0,
                'fred' : 1
            }
        }
        assert view.render_people(rows) == json.dumps(dikt)

    def test_render_projects(self):
        rows = [ ('coolproject', 5.0)
               , ('notcoolproject',4.3)
               ]
        dikt = {
            'projects' : {
                'coolproject'    : 5.0,
                'notcoolproject' : 4.3
            }
        }
        assert view.render_projects(rows) == json.dumps(dikt)

if __name__ == '__main__': unittest.main()
