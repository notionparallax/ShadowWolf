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
  var _person;
  this.get = function(personId) { 
    if (!_person || (_person.id && (personId != _person.id.$oid))) {
      _person = _Person.get({personId: personId});
    }
    return _person;
  };
  this.set = function(person) {
    _person = person;
  };
  this._get = function() { return _Person; };
});
