'use strict';

angular.module('ShadowWolf')
.controller('PeopleShowController',
function($scope, Person, $routeParams, Session, $location, Lens, Flash) {
  $scope.getCurrentUserLogin = function() { return Session.getPersonLogin(); };
  $scope._person = function() { return Person.get($routeParams.personId); };
  $scope._person().$promise.then(function(person) {
    $scope.slides = [{image: person.employee.photo.bw,    text:""},
                    {image: person.employee.photo.colour, text:""},
                    {image: person.employee.photo.fun,    text:""}];
  });
  $scope.$watch('_person()', function(newValue) {
    $scope.person = newValue;
    if (!$scope.person.employee) $scope.person.employee = { photo : {} };
    $scope.slides = [{image: newValue.employee.photo.bw,    text:""},
                    {image: newValue.employee.photo.colour, text:""},
                    {image: newValue.employee.photo.fun,    text:""}];
  });

  $scope.slides = function() {
    return slideValues;
  };

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
