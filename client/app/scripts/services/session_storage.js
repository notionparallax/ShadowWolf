'use strict';

angular.module('ShadowWolf')
.service('SessionStorage', function() {
  var COOKIE_JAR_NAME = 'session_storage';
  this.get = function(key) {
    if (localStorage[COOKIE_JAR_NAME]) {
      var storage = localStorage[COOKIE_JAR_NAME];
      var storageObject;
      try {
        storageObject = JSON.parse(storage);
      } catch (e) {
        throw new Error('SessionStorage#get: Unable to parse localstorage contents: ' + storage);
      }
      return (storageObject || {})[key];
    } else {
      return undefined;
    }
  };
  this.set = function(key,value) {
    var storageObject;
    try {
      storageObject = JSON.parse(localStorage[COOKIE_JAR_NAME]);
    } catch (e) {
      storageObject = {};
    }

    storageObject[key] = value;
    localStorage[COOKIE_JAR_NAME] = JSON.stringify( storageObject );
  };
});
