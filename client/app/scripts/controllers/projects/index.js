'use strict';

angular.module('ShadowWolf')
.controller('ProjectsIndexController',
function($scope, Projects, Session, Search) {
  $scope.limit = 60;
  $scope.searchQuery = '';
  searchBar.focus();
  $scope.searchResults = [];
  Projects.getProjects().$promise.then(function(projects) {
    $scope.searchResults = projects; // make a copy
  });
  $scope.$watch('searchQuery', function(newValue) {
    Projects.getProjects().$promise.then(function(projects) {
      $scope.searchResults = projects.filter($scope.compareTo(newValue));
    });
  });

  $scope.getKittenImage = function(i) {
    return "http://placekitten.com/g/270/24" + (i%10);
  };

  $scope.compareTo = function(query) {
    return function(project) {
      if(!query || !project) return true;
      var matchAgainst =
            [ (project.project_number || "")
            , (project.project_name || "")
            ];
      return Search.search(query, matchAgainst);
    };
  };
  $scope.showMore = function() { // boolean
    var x = $scope.searchQuery == '' && $scope.searchResults.length > $scope.limit;
    console.log(x, $scope.searchQuery, $scope.searchResults.length, $scope.limit);
    return x;
  };
  $scope.showAll = function() { // side effect
    $scope.limit = $scope.searchResults.length;
  };
});
