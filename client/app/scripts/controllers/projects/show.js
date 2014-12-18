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
        updateCache: true
      });
    }
  });
  Session.authorize = function() { return { success: true }; };
  $scope.getRelatedPeople = function(logins) {
    var logins = Beowulf.getPeopleLogins($scope.project.project_number);
    return People.getPeople(logins);
  };
  $scope.getObjectsByTag = function(tag) {
    var has = function(tag) {
      return function(object) {
        return object.tags.indexOf(tag) !== -1;
      };
    };
    return {
      dims: function() {
        return $scope.project.building.dims.filter(has(tag));
      },
      breaf_elements: function() {
        return $scope.project.building.brief_elements.filter(has(tag));
      },
      initiatives: function() {
        return $scope.project.building.legacy.initiatives.filter(has(tag));
      },
      testimonials: function() {
        return $scope.project.building.legacy.testimonials.filter(has(tag));
      },
      awards: function() {
        return $scope.project.building.legacy.awards.filter(has(tag));
      },
      certifications: function() {
        return $scope.project.building.legacy.esd.certifications.filter(has(tag));
      },
      esdInitiatives: function() {
        return $scope.project.building.legacy.esd.initiatives.filter(has(tag));
      }
    };
  };
  $scope.tags = function() { return Tags.project($scope.project).getTags(); };
});
