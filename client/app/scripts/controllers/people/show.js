'use strict';

angular.module('ShadowWolf')
.controller('PeopleShowController',
function($scope, Person, $routeParams) {
  Person.setPerson( $routeParams.id );
  $scope.person = Person.getPerson().get();
});
