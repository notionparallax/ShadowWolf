'use strict';

angular.module('ShadowWolf')
.controller('PeopleIndexController',
function($scope, People, Session, Search) {
  $scope.searchResults = [];
  People.getPeople().$promise.then(function(people) {
    $scope.searchResults = people;
  });
  $scope.$watch('searchQuery', function(newValue) {
    $scope.searchResults = People.getPeople().filter($scope.compareTo(newValue));
  });

  $scope.getMoreLink = function(personId) {
    return "#/people/" + personId;
  };

  $scope.compareTo = function(query) {
    return function(person) {
      if (!query || !person) return true;
      var matchAgainst =
          [ (person.name.preferred_first || "")
          , (person.name.preferred_last  || "")
          , (person.employee.contact.studio || "")
          ];
      return Search.search(query, matchAgainst);
    };
  };
  // Sort by condition then shuffle
  $scope.sortFunctions = [
    function(person) {
      var priority = 9; // Lower is more important
      switch (person.current_condition_name) {
        case  'Active':     priority--;
        case  'Leave':      priority--;
        case  'Maternity':  priority--;
        case  'Left':       priority--;
        case  'Retired':    priority--;
        case  'Deceased':   priority--;
        case  'Unknown':    priority--;
        case  'Applicant':  priority--;
      }
      return priority;
    },
    function(person) { return Math.random(); }
  ];
});
