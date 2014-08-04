'use strict';

angular.module('ShadowWolf')
.controller('PeopleShowController',
function($scope, Person, $routeParams, Session, $location, Lens, Flash) {
  $scope.getCurrentUserLogin = function() { return Session.getPersonLogin(); };
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
  Session.authorize = function(person) {
    var authorized = Session.getPersonId() == person.id.$oid;
    if (authorized) { return { success: true }; }
    else {
      var name;
      try { name = $scope.object.name.preferred_first }
      catch (e) { name = 'this page\'s user'; }
      return {
        success: false,
        errorMessage: '<p>You need to be logged in as ' + name + ' to change fields.</p>'
      };
    }
  };
});
