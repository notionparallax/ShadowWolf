'use strict';

angular.module('ShadowWolf')
.service('Session', function() {
  //TODO use cookies or some other more permanent store than memory
  var _accessToken;
  this.getAccessToken = function() { return _accessToken; };
  this.setAccessToken = function(accessToken) { _accessToken = accessToken; };

  var _personId;
  this.getPersonId = function() { return _personId; };
  this.setPersonId = function(personId) { _personId = personId; };

  this.logout = function() { _accessToken = undefined; _personId = undefined; };
});
