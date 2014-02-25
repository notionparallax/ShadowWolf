'use strict';

angular.module('ShadowWolf')
.controller('ProjectsShowController',
function($scope, Project, $routeParams, Session, $location, Lens) {
  if (!Session.getPersonId()) {
    $location.path("/projects");
  }
  $scope.project = Project.getProject($routeParams.projectId);
  $scope.updateObject = Project.update;

  // TODO refactor this away in common with PeopleShowController
  $scope.addObject = function(parentObject,property) {
    parentObject[property].push({});
  };
  // TODO refactor this away in common with PeopleShowController
  $scope.removeObject = function(lens,object) {
    var yes = confirm("Are you sure you wish to delete this item?");
    if (!yes) return;

    var parentObject = Lens.get($scope.person, lens);
    var index = parentObject.indexOf(object);
    parentObject.splice(index,1);
    var updateObject =
      { project: Lens.wrapObject(lens, parentObject) }; 
    console.log(updateObject);

    $scope.updateProject($scope.project.id['$oid'],
      updateObject,
      function(){
      console.log("successfully destroyed");
    }, function(){
      console.log("unsuccessfully destroyed");
      parentObject.push(object);
    });
  };
});
