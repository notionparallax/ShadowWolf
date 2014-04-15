'use strict';

angular.module('ShadowWolf')
.controller('PeopleIndexController',
function($scope, People, Session, Search) {
  var _searchResults, _searchIncrement = 21;
  People.getPeople().$promise.then(function(people) {
    _searchResults = people.slice(0,people.length); // make a copy
    $scope.visibleSearchResults = _searchResults.splice(0,_searchIncrement);
  });
  $scope.$watch('searchQuery', function(newValue) {
    _searchResults = People.getPeople().filter($scope.compareTo(newValue));
    $scope.visibleSearchResults = _searchResults.splice(0,_searchIncrement);
  });
  $scope.loadMoreResults = function() {
    $scope.visibleSearchResults =
      $scope.visibleSearchResults.concat( _searchResults.splice(0,_searchIncrement) );
  };

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
