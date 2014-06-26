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
});
