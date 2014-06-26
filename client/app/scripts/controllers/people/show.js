'use strict';

angular.module('ShadowWolf')
.controller('PeopleShowController',
function($scope, Person, $routeParams, Session, $location, Lens, Flash) {
  $scope._person = function() { return Person.get($routeParams.personId); };
  $scope.$watch('_person()', function(newValue) {
    $scope.person = newValue;
  });

  $scope.isUser = function() {
    return !!Session.getPersonId();
  };
  $scope.isCurrentUser = function() {
    return Session.getPersonId() == $routeParams.personId;
  };

  $scope.conditions = ["Active","Retired","Maternity","Leave","Deceased","Applicant","Left","Unknown"]; 
});
