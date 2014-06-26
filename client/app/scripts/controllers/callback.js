'use strict';

// The callback controler handles the login callback
angular.module('ShadowWolf')
.controller('CallbackController',
function($scope, $location, Session, Flash) {
  var message = $location.search().message;
  if (message) {
    Flash.add({
      template: '<p>You have failed to login: {{ flash.message }}</p>',
      message: message,
      css: 'flash-fail'
    }, 15000);
  } else {
    Flash.add({
      template: '<p>You have successfully logged in.</p>',
      css: 'flash-success'
    }, 5000);
    Session.setAccessToken($location.search().access_token);
    Session.setPersonId($location.search().person_id);
  }
  $location.search('');
  $location.path("/people");
});
