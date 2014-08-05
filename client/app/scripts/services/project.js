'use strict';

angular.module('ShadowWolf')
.service('Project', function($resource, $http, Session, Config) {
  $http.defaults.useXDomain = true;

  var _Project = $resource(Config.getEndPoint() + '/projects/:projectId.json?access_token=:accessToken',
    { projectId: '@projectId', accessToken: Session.getAccessToken() },
    {
      'get':    {method:'GET'},
      'save':   {method:'POST'},
      'update': {method:'PATCH'},
      'query':  {method:'GET', isArray:true},
      'remove': {method:'DELETE'},
      'delete': {method:'DELETE'}
    });
  var _project;
  this.get = function(projectId) {
    if (!_project || (_project.id && projectId != _project.id.$oid)) {
      _project = _Project.get({projectId: projectId});
      // This is unnecesarily waiting for the first request to finish
      _project.$promise.then(function() {
        _Project.get({projectId: projectId, 'refresh_hero_image': true},
          function(project) {
            _project = project;
          });
      });
    }
    return _project;
  };
  this.set = function(project) {
    _project = project;
  };
  this._get = function() { return _Project; };
});
