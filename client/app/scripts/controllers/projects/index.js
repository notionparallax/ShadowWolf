'use strict';

angular.module('ShadowWolf')
.controller('ProjectsIndexController',
function($scope, Projects, Session, Search) {
  var _searchResults, _searchIncrement = 21;
  Projects.getProjects().$promise.then(function(projects) {
    _searchResults = projects.slice(0,projects.length); // make a copy
    $scope.visibleSearchResults = _searchResults.splice(0,_searchIncrement);
  });
  $scope.$watch('searchQuery', function(newValue) {
    _searchResults = Projects.getProjects().filter($scope.compareTo(newValue));
    $scope.visibleSearchResults = _searchResults.splice(0,_searchIncrement);
  });
  $scope.loadMoreResults = function() {
    $scope.visibleSearchResults =
      $scope.visibleSearchResults.concat( _searchResults.splice(0,_searchIncrement) );
  };

  $scope.getMoreLink = function(projectId) {
    return "#/projects/" + projectId;
  };
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
});
