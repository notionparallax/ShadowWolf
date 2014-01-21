'use strict';

angular.module('ShadowWolf')
.controller('PeopleIndexController',
function($scope, People, Session) {
  $scope.people = People.getPeople;
  $scope.loggedIn = function() { return !!Session.getAccessToken(); };
  $scope.logout = function() { console.log('logout'); Session.logout(); };

  $scope.getMoreLink = function(personId) {
    if (Session.getPersonId()) {
      return "#/people/" + personId;
    }
  };
  /**
   * Compares the searchQuery with the actual person.
   * Is a match if the query is a (space separated) 3-tuple that ORs the
   * results of substring matches on first name, last name and studio,
   * respectively. Use of '*' is accepted to match all results.
   */
  $scope.compareTo = function(query) {
    return function(person) {
      if (!query || !person) return true;
      // Split the query by spaces into terms
      var queryTerms = query.split(' '),
          matchAgainst =
          [ (person.name.preferred_first || "")
          , (person.name.preferred_last  || "")
          , (person.employee.contact.studio || "")
          ];
      // Then we OR each term against all the fields and AND all the terms.
      return queryTerms.map(function(term) {
          return matchAgainst.map(function(field) {
            return field.toLowerCase().match(term.toLowerCase());
          }).reduce(function(a,b){return a || b;});
        }).reduce(function(a,b){return a && b;});
    };
  };
});
