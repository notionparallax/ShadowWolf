'use strict';

angular.module('ShadowWolf')
.controller('ProjectsShowController',
function($scope, Project, $routeParams, Session, $location, Lens) {
  if (!Session.getPersonId()) {
    $location.path("/projects");
  }
  $scope._project = function() { return Project.get($routeParams.projectId); };
  $scope.$watch('_project()', function(newValue) {
    $scope.project = newValue;
  });
});
