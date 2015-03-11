'use strict';
angular.module('ShadowWolf')
.service('Malcolm', function(Config, $http) {
  var db = new Malcolm.db()
    .addDriver('rails', function() {
      this.buffer = true;
      this.run = function(query) {
        var config = query.config;
        if        ('insert' in config) {
        } else if ('select' in config) {
          var url = Config.getEndPoint() + '/';
          var httpConfig = { params: {} };
          if (config.collection === 'projects') {
            var singular = query.limit === 1;
            var projectID;
            for (var p in query.predicates) {
              if ('id' in query.predicates[p]) {
                projectID = query.predicates[p].id;
              }
              if (!singular && 'in' in query.predicates[p]) {
                // Can have { in: { project_number: ['project_number'] } }
                // to select projects with project numbers in the array
                for (var prop in query.predicates[p].in) {
                  httpConfig.params[prop + '[]'] = query.predicates[p].in[prop];
                }
              }
            }
            if (singular && projectID !== undefined) {
              url += 'projects/' + projectID + '.json';
            } else {
              url += 'projects.json';
            }
          }
          return $http.get(url, httpConfig);
        } else if ('update' in config) {
        } else if ('remove' in config) {
        }
      };
    });

  this.projects = new db.collection('projects');
  this.people   = new db.collection('people');
  window.projects = this.projects;
});
