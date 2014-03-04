'use strict';

angular.module('ShadowWolf')
.controller('ProjectsShowController',
function($scope, Project, $routeParams, Session, $location, Lens) {
  if (!Session.getPersonId()) {
    $location.path("/projects");
  }
  $scope.project = Project.getProject($routeParams.projectId);
});
