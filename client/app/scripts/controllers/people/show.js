'use strict';

angular.module('ShadowWolf')
.controller('PeopleShowController',
function($scope, Person, $routeParams, Session, $location, Lens) {
  if (!Session.getPersonId()) {
    $location.path("/people");
  }
  $scope.person = Person.getPerson($routeParams.personId);
});
