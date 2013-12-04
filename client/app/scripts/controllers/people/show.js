'use strict';

angular.module('ShadowWolf')
.controller('PeopleShowController',
function($scope, People, $routeParams) {
  $scope.person = function() {
    return People.getPerson( $routeParams.id );
  };
});
