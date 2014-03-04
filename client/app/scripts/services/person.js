'use strict';

angular.module('ShadowWolf')
.service('Person', function($resource, $http, Session, Config) {
  $http.defaults.useXDomain = true;
  
  var _Person = $resource(Config.getEndPoint() + '/people/:personId.json?access_token=:accessToken',
    { personId: '@personId', accessToken: Session.getAccessToken() },
    {
      'get':    {method:'GET'},
      'save':   {method:'POST'},
      'update': {method:'PATCH'},
      'query':  {method:'GET', isArray:true},
      'remove': {method:'DELETE'},
      'delete': {method:'DELETE'}
    });
  this.getPerson = function(personId) { return _Person.get({personId: personId}); };
  this._getPerson = function() { return _Person; };
});
