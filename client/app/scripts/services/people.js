'use strict';

angular.module('ShadowWolf')
.service('People', function($resource, $http, Session,Config) {
  function initPeople() {
    var peoplePromise = _People.query();
    peoplePromise.$promise.then(function(people) {
      localStorage.people = JSON.stringify(people);
    });
    if (localStorage.people) {
      return { $promise:
        { then: function(handler) {
            return handler(JSON.parse(localStorage.people));
          }
        }
      };
    } else {
      return peoplePromise;
    }
  }
  $http.defaults.useXDomain = true;

  var _People = $resource(Config.getEndPoint() + '/people.json');
  var _people = {};
  initPeople().$promise.then(function(people) {
    for (var p in people) {
      var person = people[p];
      if (person.employee && person.employee.login) {
        _people[person.employee.login.toLowerCase()] = person;
      }
    }
  });
  this.getPeople = function(logins) {
    if (!logins) return _people;
    else {
      var peopleMatchingLogins = {};
      for (var i in logins) {
        var login = logins[i].toLowerCase();
        var person = _people[login];
        if (person) {
          peopleMatchingLogins[login] = person;
        }
      }
      return peopleMatchingLogins;
    }
  };
  this.getPerson = function(id) {
    for (var p in _people) {
      var person = _people[p];
      if (person.id['$oid'] === id) {
        return person;
      }
    }
  };
});
