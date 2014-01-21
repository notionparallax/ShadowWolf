'use strict';

angular.module('ShadowWolf')
.service('Person', function($resource, $http, Session) {
  $http.defaults.useXDomain = true;
  
  var _Person = $resource('http://10.1.3.70:port/people/:personId.json?access_token=:accessToken',
    { port: ':3000', personId: '@personId', accessToken: Session.getAccessToken() });
  this.getPerson = function(personId) { return _Person.get({personId: personId}); };
});
