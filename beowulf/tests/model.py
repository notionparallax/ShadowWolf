import unittest
import os
import sys
sys.path.insert(0,'.')
from app import model

class ModelTests(unittest.TestCase):
    def __init__(self, *args, **kwargs):
        super(ModelTests, self).__init__(*args, **kwargs)

        self.schema_up = """
        CREATE TABLE ProjProjectOutlineDimension (
            SYSProjectOutlineID INTEGER,
            projectcode TEXT
        );
        CREATE TABLE ProjResourceDimension (
            SYSResourceID INTEGER,
            resourceid TEXT
        );
        CREATE TABLE ProjFact (
            SYSResourceID INTEGER,
            SYSProjectOutlineID INTEGER,
            actualhours FLOAT
        );
        """
        self.schema_down = """
        DROP TABLE IF EXISTS ProjFact;
        DROP TABLE IF EXISTS ProjProjectOutlineDimension;
        DROP TABLE IF EXISTS ProjResourceDimension;
        """
        os.system('sqlite3 test.db ""')
        conn_string = "Driver=SQLITEY;Database=%s/test.db" % os.getcwd()
        self.model = model.Model(conn_string)
        self.model.execute(self.schema_down, save_result=False)
        self.model.execute(self.schema_up, save_result=False)

        queries = ["""
        INSERT INTO ProjProjectOutlineDimension VALUES
            (0, 'cool project'),
            (1, 'not cool project')
            ""","""
        INSERT INTO ProjResourceDimension VALUES
            (0, 'cool guy'),
            (1, 'uncool guy'),
            (2, 'trex')
            ""","""
        INSERT INTO ProjFact VALUES
            (0,0,8),
            (0,0,8),
            (0,0,5),
            (1,1,2),
            (1,1,2),
            (1,0,1),
            (2,0,0)
        """]
        for query in queries:
            self.model.execute(query, save_result=False)

    def test_get_logins(self):
        logins = self.model.getlogins('cool project')
        assert len(logins) == 2, "Found %s logins instead" % len(logins)
        assert logins[0][0] == 'cool guy' and logins[0][1] == 21.0
        assert logins[1][0] == 'uncool guy' and logins[1][1] == 1

    def test_get_project_numbers(self):
        projects_worked = self.model.getprojectnumbers('uncool guy')
        assert len(projects_worked) == 2
        worked_hours = [ row[1] for row in projects_worked ]
        assert worked_hours == [1.0,4.0]

if __name__ == '__main__': unittest.main()
