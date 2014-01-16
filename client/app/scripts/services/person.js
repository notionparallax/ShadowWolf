'use strict';

angular.module('ShadowWolf')
.service('Person', function($resource, $http, Session) {
  $http.defaults.useXDomain = true;
  
  var _Person = $resource('http://localhost:port/people/:personId.json?access_token=:accessToken',
    { port: ':3000', personId: Session.getPersonId(), accessToken: Session.getAccessToken() });
  var _person = _Person.get();
  this.getPerson = function() { return _person; };
});
