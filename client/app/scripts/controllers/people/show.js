'use strict';

angular.module('ShadowWolf')
.controller('PeopleShowController',
function($scope, Person, $routeParams, Session, $location, Lens, Flash) {
  if (!Session.getPersonId()) {
    Flash.add({
      template: '<p>You must be logged in to view that page.</p>',
      css: 'flash-failure'
    }, 5000);
    $location.path("/people");
  }
  $scope._person = function() { return Person.get($routeParams.personId); };
  $scope.$watch('_person()', function(newValue) {
    $scope.person = newValue;
  });
});
