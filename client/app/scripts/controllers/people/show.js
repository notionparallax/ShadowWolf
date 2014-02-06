'use strict';

angular.module('ShadowWolf')
.controller('PeopleShowController',
function($scope, Person, $routeParams, Session, $location) {
  if (!Session.getPersonId()) {
    $location.path("/people");
  }
  $scope.person = Person.getPerson($routeParams.personId);
  $scope.updatePerson = Person.update;

  $scope.addObject = function(object,property) {
    object[property].push({});
  };
});
