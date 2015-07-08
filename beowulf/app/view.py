import json

def render_people(rows):
    people = {}
    for row in rows:
        people[row[0]] = row[1]
    return json.dumps({ 'people' : people })

def render_projects(rows):
    projects = {}
    for row in rows:
        projects[row[0]] = row[1]
    return json.dumps({ 'projects' : projects })

def render_error():
    return json.dumps({
        'errors': ['Something went wrong in the database.']
    })
