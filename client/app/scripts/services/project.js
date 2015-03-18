'use strict';

angular.module('ShadowWolf')
.service('Project', function($resource, $http, Session, Config, Projects) {
  $http.defaults.useXDomain = true;

  var _Project = $resource(Config.getEndPoint() + '/projects/:projectIdOrProjectNumber.json?access_token=:accessToken',
    { projectIdOrProjectNumber: '@projectIdOrProjectNumber', accessToken: Session.getAccessToken() },
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
      _project = _Project.get({projectIdOrProjectNumber: projectId});
    }
    return _project;
  };
  this.getByProjectNumber = function(projectNumber) {
    if (!_project || (_project.project_number && _project.project_number !== projectNumber)) {
      _project = _Project.get({projectIdOrProjectNumber: projectNumber});
    }
    return _project;
  };
  this.set = function(project) {
    _project = project;
  };
  this._get = function() { return _Project; };
});
