'use strict';

angular.module('ShadowWolf')
.controller('PeopleIndexController',
function($scope, People, Session, Search) {
  $scope.people = People.getPeople;
  $scope.getMoreLink = function(personId) {
    if (Session.getPersonId()) {
      return "#/people/" + personId;
    }
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
