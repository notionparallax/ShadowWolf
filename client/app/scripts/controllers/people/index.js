'use strict';

angular.module('ShadowWolf')
.controller('PeopleIndexController',
function($scope, People) {
  $scope.peeps = 'hello';
  $scope.people = People.People.query()
});
