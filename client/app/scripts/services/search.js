'use strict';

angular.module('ShadowWolf')
.service('Search', function() {
  this.search = function(query, matchAgainst) {
    // Split the query by spaces into terms
    var queryTerms = query.split(' ');
    // Then we OR each term against all the fields and AND all the terms.
    return queryTerms.map(function(term) {
      return matchAgainst.map(function(field) {
        return field.toLowerCase().match(term.toLowerCase());
      }).reduce(function(a,b){return a || b;});
    }).reduce(function(a,b){return a && b;});
  };
});
