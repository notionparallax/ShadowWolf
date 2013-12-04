'use strict';

angular.module('ShadowWolf')
.controller('PeopleIndexController',
function($scope, People) {
  $scope.people = People.getPeople;
});
