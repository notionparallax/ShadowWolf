'use strict';

// The callback controler handles the login callback
angular.module('ShadowWolf')
.controller('CallbackController',
function($scope, $location, Session) {
  Session.setAccessToken($location.search().access_token);
  Session.setPersonId($location.search().person_id);
  $location.search('');
  $location.path("/people");
});
