'use strict';

angular.module('ShadowWolf')
.controller('PeopleShowController',
function($scope, Person, $routeParams, Session, $location) {
  if ($routeParams.id != Session.getPersonId()) {
    $location.path("/people");
  }
  $scope.person = Person.getPerson;
});
