'use strict';

angular.module('ShadowWolf')
.service('People', function($resource, $http, Session,Config) {
  $http.defaults.useXDomain = true;
  function initPeople() {
    var peoplePromise = _People.query();
    peoplePromise.$promise.then(function(people) {
      localStorage.people = angular.toJson(people);
    });
    if (localStorage.people) {
      return { $promise:
        { then: function(handler) {
            return handler(angular.fromJson(localStorage.people));
          }
        }
      };
    } else {
      return peoplePromise;
    }
  }

  var _People = $resource(Config.getEndPoint() + '/people.json');
  var _people = initPeople();
  this.getPeople = function() { return _people; };
  this.getPerson = function(id) {
    for (var p in _people) {
      var person = _people[p];
      if (person.id['$oid'] === id) {
        return person;
      }
    }
  };
});
