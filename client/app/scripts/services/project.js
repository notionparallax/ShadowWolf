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
  this.getProject = function(projectId) { return _Project.get({projectId: projectId}); };
  this.update = function(id,postData,success,error) {
    return _Project.update({ projectId: id}, postData, success, error);
  };
});
