'use strict';

angular.module('ShadowWolf')
.controller('ProjectsShowController',
function($scope, Project, $routeParams, Session, $location, Lens, Flash, Beowulf, People,$q, Tags, Oaf) {
  if (!Session.getPersonId()) {
    console.error('non logged in user tried to access projects');
    Flash.add({
      template: '<p>You must be logged in to view that page.</p>',
      css: 'flash-fail'
    }, 5000);
    $location.path("/projects");
  }
  var loadedImage = false;
  $scope._project = function() { return Project.get($routeParams.projectId); };
  $scope.$watch('_project()', function(newValue) {
    $scope.project = newValue;
    if (!loadedImage && newValue.project_number) {
      loadedImage = true;
      Oaf.getProjectImage($scope.project.project_number, {
        updateCache: true,
        tags: $scope.tags()
      });
    }
  });
  $scope.getImages = function() {
    return Oaf.getImagesByTags($scope.project.project_number, $scope.tags() );
  };
  Session.authorize = function() { return { success: true }; };
  $scope.getRelatedPeople = function(logins) {
    var logins = Beowulf.getPeopleLogins($scope.project.project_number);
    return People.getPeople(logins);
  };

  $scope.getPropertiesWithTag = function(object,tag) {
    return object.filter(function(property) {
      return property.tags.indexOf(tag) !== -1;
    });
  };
  $scope.tags = function() { return Tags.project($scope.project).getTags(); };
});
