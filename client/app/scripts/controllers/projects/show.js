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
  $scope._project = function() { return Project.getByProjectNumber($routeParams.projectNumber); };
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

  // "Decorates" input lists with cache identifiers
  $scope.getPropertiesWithTag = (function(){
    // Must cache actual items so don't trigger infinite $digest
    // Hence local scope
    var cache = {}; 
    var counter = 0;
    var CACHE_PROPERTY_NAME = '__projects_show_controller_hidden_cache_identifier';
    return function(object,tag) {
      if (object === undefined) return;
      // Create a spot in cache for list if not existant
      if (!object[CACHE_PROPERTY_NAME]) {
        counter++; 
        object[CACHE_PROPERTY_NAME] = counter;
        cache[counter] = {};
      }

      // Fill spot in cache for tag if not existant
      var objectId = object[CACHE_PROPERTY_NAME];
      if (!cache[objectId][tag]) {
        cache[objectId][tag] = object.filter(function(property) {
          return property.tags.indexOf(tag) !== -1;
        });
      }

      // Retrieve from cache
      return cache[objectId][tag];
    };
  }());
  $scope.tags = function() { return Tags.project($scope.project).getTags(); };
  $scope.refreshOafImages = function() {
    Oaf.getImagesByTags($scope.project.project_number, $scope.tags(),
        { fetch_latest: true });
  };

  $scope.compareNullableDates = function comp(a,b) {
    if (a.date === null) return 1;
    else {
      if (b === undefined || b.date === null) return -1;
      else return a.date > b.date;
    }
  };

});
