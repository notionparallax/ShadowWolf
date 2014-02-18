'use strict';

angular.module('ShadowWolf')
.controller('ProjectsIndexController',
function($scope, Projects, Session) {
  $scope.projects = Projects.getProjects;

  $scope.getMoreLink = function(projectId) {
    return "#/projects/" + projectId;
  };

  /**
   * TODO refactor this to not be a duplicate of controllers/people/index.js.
   * Similar to the compareTo function in the PeopleIndexController.
   */
  $scope.compareTo = function(query) {
    return function(project) {
      if(!query || !project) return true;
      var queryTerms = query.split(' '),
          matchAgainst =
            [ (project.project_number || "")
            , (project.project_categories || "")
            ];
      return queryTerms.map(function(term) {
        return matchAgains.map(function(field) {
          return field.toLowerCase().match(term.toLowerCase());
        }).reduce(function(a,b){return a || b;});
      }).reduce(function(a,b){return a && b;});
    };
  };
});
