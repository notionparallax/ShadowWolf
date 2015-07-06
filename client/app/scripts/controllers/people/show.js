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
    return Session.getPersonLogin() == $routeParams.login;
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
  $scope.Beowulf = Beowulf;
  $scope.relatedProjects = [];
  $scope.$watch('Beowulf.getProjectNumbers( person.employee.login )', function(hoursByProjectNumber) {
    var projects = Projects.getProjects(
                   Object.keys( hoursByProjectNumber )
        );
    var projectsArray =  [];
    for (var i in projects) {
      projectsArray.push( projects[i] );
    }
    var resultArray = projectsArray
      .map(function(project) { return {
        hours: hoursByProjectNumber[project.project_number.toUpperCase()],
        project: project
      };
    });
    $scope.relatedProjects = resultArray;
  }, true);
});
