'use strict';

angular.module('ShadowWolf')
.controller('ProjectsIndexController',
function($scope, Projects, Session, Search, Oaf) {
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

  $scope.getProjectImage = function(project, index) {
    return Oaf.getProjectImage(project.project_number, {
      updateCache: false
    })[0]
      || "http://placekitten.com/g/270/24" + (index%10);
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
});
