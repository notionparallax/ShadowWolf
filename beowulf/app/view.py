import json

def render_people(rows):
    return json.dumps({
        'people' : [
            { 'login' : row[0],
              'hours' : row[1] }
            for row in rows
        ]
    })

def render_projects(rows):
    return json.dumps({
        'projects' : [
            { 'project_number' : row[0],
              'hours'          : row[1] }
            for row in rows
        ]
    })

def render_error():
    return json.dumps({
        'errors': ['Something went wrong in the database.']
    })
