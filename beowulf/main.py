import json
import os
import pypyodbc
from flask import Flask, Response

app = Flask(__name__)
DEBUG = 'debug' in os.environ
PORT = int(os.environ['PORT'])
conn_string = "DRIVER={FreeTDS};SERVER=%s;UID=%s;PWD=%s;DATABASE=%s;Port=1433" % \
        (os.environ['MSSQL_SERVER']
        ,os.environ['MSSQL_UID']
        ,os.environ['MSSQL_PWD']
        ,os.environ['MSSQL_DB']
        ) 

@app.route('/')
def index():
    with pypyodbc.connect(conn_string) as conn:
        return conn.cursor().execute('SELECT @@VERSION').fetchone()

@app.route('/get_projects/<login>')
def get_projects(login):
    with pypyodbc.connect(conn_string) as conn:
        cursor = conn.cursor()
        cursor.execute("""
        SELECT DISTINCT projectcode
        FROM ProjFact pf
            JOIN ProjResourceDimension prd on pf.SYSResourceID = prd.SYSResourceID
            JOIN ProjProjectOutlineDimension ppod on pf.SYSProjectOutlineID = ppod.SYSProjectOutlineID
        WHERE prd.resourceid = ?
        AND actualhours <> 0
        """, [login.upper()])
        return Response(json.dumps([row[0] for row in cursor.fetchall()]), mimetype='application/json')

@app.route('/get_people/<project_number>')
def get_people(project_number):
    with pypyodbc.connect(conn_string) as conn:
        cursor = conn.cursor()
        cursor.execute("""
        SELECT DISTINCT resourceid
        FROM ProjResourceDimension prd
            JOIN ProjFact pf on prd.SYSResourceID = pf.SYSResourceID
            JOIN ProjProjectOutlineDimension ppod on pf.SYSProjectOutlineID = ppod.SYSProjectOutlineID
        WHERE projectcode = ?
        AND actualhours <> 0
        """, [project_number.upper()])
        return Response(json.dumps([row[0] for row in cursor.fetchall()]), mimetype='application/json')

if __name__ == '__main__':
    app.run(host='0.0.0.0',port=PORT,debug=DEBUG)
