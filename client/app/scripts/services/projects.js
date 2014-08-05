'use strict';

angular.module('ShadowWolf')
.service('Projects', function($resource, $http, Session, Config) {
  var _Projects = $resource(Config.getEndPoint() + '/projects.json');
  var _projects = _Projects.query();
  this.getProjects = function() { return _projects; };
  this.getProject = function(id) {
    for (var p in _projects) {
      var project = _projects[p];
      if (project.id['$oid'] === id) {
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
