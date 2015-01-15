'use strict';

angular.module('ShadowWolf')
.controller('ProjectsNewController',
function($scope, $timeout, $http, Config, $location) {
  $scope.submitting = false;
  $scope.project = {};
  $scope.validEntry = function() {
    return (!$scope.existingProjectNumber && ($scope.project.number || []).length > 3)
      && $scope.existingPersonLogin
      && ($scope.project.name || []).length > 5;
  };
  /**
   * Have to make my own debouncer because this version of angular doesn't have one
   */
  function debounceWatch(variable, handler, debounceDelay) {
    var timer;
    $scope.$watch(variable,function(newValue) {
      if (timer !== undefined) {
        $timeout.cancel(timer);
      }
      timer = $timeout(function() {
        timer = undefined;
        handler(newValue);
      }, debounceDelay);
    });
  }
  debounceWatch('project.number', function(newNumber) {
    $http.get(Config.getEndPoint() + '/projects/numbers', {
      params: { project_number: newNumber }
    }).then(function(result) {
      if (result.data.length > 0) {
        var project = result.data[0];
        $scope.existingProjectNumber = {
          project_number: project.project_number,
          project_name: (project.building.phases[0] || {}).project_name
        };
      } else {
        $scope.existingProjectNumber = undefined;
      }
    });
  }, 500);
  debounceWatch('project.login', function(newLogin) {
    $http.get(Config.getEndPoint() + '/people/logins', {
      params: { login: newLogin }
    }).then(function(result) {
      if (result.data.length > 0) {
        var person = result.data[0];
        $scope.existingPersonLogin = {
          login: (person.employee || {}).login,
          name: (person.name || {}).preferred_first + ' ' + (person.name || {}).preferred_last
        };
      } else {
        $scope.existingPersonLogin = undefined;
      }
    });
  }, 500);
  $scope.submit = function(){
    $scope.submitting = true;
    $http.post(Config.getEndPoint() + '/projects.json', {
      project: {
        project_number: $scope.project.number,
        project_name: $scope.project.name,
        project_login: $scope.project.login,
      }
    }).then(function(result) {
      $location.path('/projects/' + result.data._id.$oid);
    });
  };
});
