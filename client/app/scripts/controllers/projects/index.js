'use strict';

angular.module('ShadowWolf')
.controller('ProjectsIndexController',
function($scope, Projects, Session, Search, Oaf, SearchScopeLinker) {
  $scope.limit = 60;
  $scope.searchQuery = '';
  searchBar.focus();
  $scope.searchResults = Projects.getProjects();
  $scope.$watch('searchQuery', function(newValue) {
    var projects = Projects.getProjects();
    var results = [];
    var matches = $scope.compareTo(newValue);
    for (var p in projects) {
      if (matches( projects[p] )) results.push(projects[p]);
    }
    $scope.searchResults = results;
  });

  $scope.getProjectImageUrl = function(project) {
    return Oaf.getProjectImageUrl(project.project_number);
  };

  $scope.compareTo = function(query) {
    return function(project) {
      if(!query || !project) return true;
      var phase = {};
      if (project.building && project.building.phases)
        phase = project.building.phases[0];
      var matchAgainst =
            [ (project.project_number || "")
            , (phase.project_name || "")
            ];
      return Search.search(query, matchAgainst);
    };
  };
  $scope.showMore = function() { // boolean
    return $scope.searchQuery == '' && $scope.searchResults.length > $scope.limit;
  };
  $scope.showAll = function() { // side effect
    $scope.limit = $scope.searchResults.length;
  };
  SearchScopeLinker.link($scope,'searchQuery','q');
});
