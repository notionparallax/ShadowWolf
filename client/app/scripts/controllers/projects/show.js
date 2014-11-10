'use strict';

angular.module('ShadowWolf')
.controller('ProjectsShowController',
function($scope, Project, $routeParams, Session, $location, Lens, Flash, Beowulf, People) {
  if (!Session.getPersonId()) {
    Flash.add({
      template: '<p>You must be logged in to view that page.</p>',
      css: 'flash-fail'
    }, 5000);
    $location.path("/projects");
  }
  $scope._project = function() { return Project.get($routeParams.projectId); };
  $scope.$watch('_project()', function(newValue) {
    $scope.project = newValue;
  });
  Session.authorize = function() { return { success: true }; };
  $scope.getRelatedPeople = function(logins) {
    var logins = Beowulf.getPeopleLogins($scope.project.project_number);
    return People.getPeople(logins);
  };
});
