'use strict';

angular.module('ShadowWolf')
.controller('PeopleIndexController',
function($scope, People) {
  $scope.people = People.getPeople;
  /**
   * Compares the searchQuery with the actual person.
   * Is a match if the query is a (space separated) 3-tuple that ORs the
   * results of substring matches on first name, last name and studio,
   * respectively. Use of '*' is accepted to match all results.
   */
  $scope.compareTo = function(query) {
    return function(person) {
      if (!query || !person) return true;
      // Break the query into first, last and studio
      var queryTerms = query.split(' '),
          queryObject =
          {
            first:   queryTerms[0]  ?  queryTerms[0]  :  null,
            last:    queryTerms[1]  ?  queryTerms[1]  :  null,
            studio:  queryTerms[2]  ?  queryTerms[2]  :  null,
          },
          // Match each term against the person
          results =
          [ person.name.first.match( queryObject.first ) != null
          , person.name.first.match( queryObject.last  ) != null
          , person.employee.contact.studio.match( queryObject.studio ) != null
          ];

      // Do a logical OR on the results
      return results.reduce(function(a,b){return a || b;})
    };
  };
});
