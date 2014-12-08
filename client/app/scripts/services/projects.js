'use strict';

angular.module('ShadowWolf')
.service('Projects', function($resource, $http, Session, Config) {
  function initProjects() {
    var projectsPromise = _Projects.query();
    projectsPromise.$promise.then(function(projects) {
      localStorage.projects = JSON.stringify(projects);
    });
    if (localStorage.projects) {
      return { $promise:
        { then: function(handler) {
            return handler(JSON.parse(localStorage.projects));
          }
        }
      };
    } else {
      return projectsPromise;
    }
  }

  var _Projects = $resource(Config.getEndPoint() + '/projects.json');
  var _projects = {};
  initProjects().$promise.then(function(projects) {
    for (var p in projects) {
      var project = projects[p];
      _projects[project.project_number] = project;
    }
  });
  this.getProjects = function(projectNumbers) { 
    if (!projectNumbers) return _projects;
    else {
      var projectsMatchingNumbers = {};
      for (var i in projectNumbers) {
        var projectNumber = projectNumbers[i].toLowerCase();
        var project = _projects[projectNumber];
        if (project) {
          projectsMatchingNumbers[projectNumber] = project;
        }
      }
      return projectsMatchingNumbers;
    }
  };
  this.getProject = function(projectNumber) {
    if (!localStorage.projects) return null;
    for (var p in localStorage.projects) {
      var project = localStorage.projects[p];
      if (project.project_number === projectNumber) {
        return project;
      }
    }
  };
  this.updateProjectImage = function(project) {
    for (var index in _projects) {
      if (_projects[index].project_number === project.project_number) {
        _projects[index].img = project.img;
        return;
      }
    }
  };
});
