'use strict';

angular.module('ShadowWolf')
.controller('ProjectsShowController',
function($scope, Project, $routeParams, Session, $location, Lens, Flash) {
  if (!Session.getPersonId()) {
    Flash.add({
      template: '<p>You must be logged in to view that page.</p>',
      css: 'flash-failure'
    }, 5000);
    $location.path("/projects");
  }
  $scope._project = function() { return Project.get($routeParams.projectId); };
  $scope.$watch('_project()', function(newValue) {
    $scope.project = newValue;
  });
});
