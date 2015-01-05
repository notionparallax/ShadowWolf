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
  $scope.getImages = function() {
    return Oaf.getProjectImage($scope.project.project_number);
  };
  Session.authorize = function() { return { success: true }; };
  $scope.getRelatedPeople = function(logins) {
    var logins = Beowulf.getPeopleLogins($scope.project.project_number);
    return People.getPeople(logins);
  };

  // has() is used by the tag objects $watcher to filter
  var has = function(tag) {
    return function(object) {
      return object.tags.indexOf(tag) !== -1;
    };
  };
  $scope.$watch('tags()', function(tags) {
    $scope.tagsProperties = {};
    var building = $scope.project.building;
    for (var tagIndex in tags) {
      var tag = tags[tagIndex];
      $scope.tagsProperties[tag] = {
        dims:            building.dims                     .filter(has(tag)),
        brief_elements:  building.brief_elements           .filter(has(tag)),
        initiatives:     building.legacy.initiatives       .filter(has(tag)),
        testimonials:    building.legacy.testimonials      .filter(has(tag)),
        awards:          building.legacy.awards            .filter(has(tag)),
        templates:       building.legacy.templates         .filter(has(tag)),
        certifications:  building.legacy.esd.certifications.filter(has(tag)),
        esdInitiatives:  building.legacy.esd.initiatives   .filter(has(tag))
      };
    }
  }, true /* necessary to avoid infinite digest */ );
  $scope.tags = function() { return Tags.project($scope.project).getTags(); };
});
