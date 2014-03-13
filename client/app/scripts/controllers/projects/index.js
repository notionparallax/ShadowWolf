'use strict';

angular.module('ShadowWolf')
.controller('ProjectsIndexController',
function($scope, Projects, Session, Search) {
  $scope.projects = Projects.getProjects;

  $scope.getMoreLink = function(projectId) {
    return "#/projects/" + projectId;
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
