'use strict';

angular.module('ShadowWolf')
.controller('PeopleShowController',
function($scope, Person, $routeParams, Session, $location, Lens, Flash, Beowulf, Projects) {
  $scope.getCurrentUserLogin = function() { return Session.getPersonLogin(); };
  $scope._person = function() { return Person.getByLogin($routeParams.login); };
  $scope._person().$promise.then(function(newValue){
    $scope.person = newValue;
    if (!$scope.person.employee) $scope.slides = [];
    else $scope.slides = [{image: newValue.employee.photo.bw,    text:""},
                          {image: newValue.employee.photo.colour, text:""},
                          {image: newValue.employee.photo.fun,    text:""}];
  });
  $scope.$watch('_person()', function(newValue) {
    $scope.person = newValue;
    if (!$scope.person.employee) $scope.slides = [];
    else $scope.slides = [{image: newValue.employee.photo.bw,    text:""},
                          {image: newValue.employee.photo.colour, text:""},
                          {image: newValue.employee.photo.fun,    text:""}];
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
  $scope.getRelatedProjects = function() {
    if (!$scope.person.employee) return [];
    var projectNumbers = Beowulf.getProjectNumbers($scope.person.employee.login);
    return Projects.getProjects(projectNumbers);
  };
});
