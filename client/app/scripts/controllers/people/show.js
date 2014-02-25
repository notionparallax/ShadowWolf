'use strict';

angular.module('ShadowWolf')
.controller('PeopleShowController',
function($scope, Person, $routeParams, Session, $location, Lens) {
  if (!Session.getPersonId()) {
    $location.path("/people");
  }
  $scope.person = Person.getPerson($routeParams.personId);
  $scope.updateObject = Person.update;

  $scope.addObject = function(parentObject,property) {
    parentObject[property].push({});
  };
  $scope.removeObject = function(lens,object) {
    var yes = confirm("Are you sure you wish to delete this item?");
    if (!yes) return;

    var parentObject = Lens.get($scope.person, lens);
    var index = parentObject.indexOf(object);
    parentObject.splice(index,1);
    var updateObject =
      { person: Lens.wrapObject(lens, parentObject) }; 
    console.log(updateObject);

    $scope.updatePerson($scope.person.id['$oid'],
      updateObject,
      function(){
      console.log("successfully destroyed");
    }, function(){
      console.log("unsuccessfully destroyed");
      parentObject.push(object);
    });
  };
});
