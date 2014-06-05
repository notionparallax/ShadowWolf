var LoginButton = require("./page_objects.js").LoginButton;

function setup(){
  afterEach(function(){
    ptor = protractor.getInstance();
    ptor.clearMockModules();
  });
}
function visit(path) {
  var url = 'http://'
    + process.env['CLIENT_PORT_9000_TCP_ADDR']
    + ':'
    + process.env['CLIENT_PORT_9000_TCP_PORT']
    + '/#/'
    + path;
  return browser.get(url);
}
function mockBackend(mappings, personId, accessToken) {
  /**
   * TODO. This is pretty revolting. Dave made an issue here:
   *   https://github.com/angular/protractor/issues/695
   * See a PR to fix here:
   *   https://github.com/angular/protractor/pull/787
   */
      
  var httpBackendMock = function(){
    angular.module('httpBackendMock', ['ShadowWolf', 'ngMockE2E'])
    .run(function($httpBackend, $document) {
      function log(msg) {
        var logTag = angular.element('<p class="log">' + msg + '</p>');
        document.body.appendChild(logTag[0]);
      }
      // UGLY
      for (var regex in mappings) {
        $httpBackend.whenGET(new RegExp(regex))
          .respond(function(method, url, data, headers){
            log(['request',method,url].join(' '));
            if (personId && accessToken) {
              var params = {};
              for (var param in url.split('?')[1].split('&')) {
                params[param.split('=')[0]] = param.split('=')[1];
              }
              var personIdMatch = personId === params.person_id,
                  accessTokenMatch = accessToken === params.access_token;
                return [200,mappings[regex]];
              if (personIdMatch && accessTokenMatch) {
                return mappings[regex].me;
              } else if (accessTokenMatch) {
                return mappings[regex].user;
              } else {
                return mappings[regex].guest;
              }
            } else {
              return mappings[regex];
            }
          });
      }
      $httpBackend.when('PATCH',/.*/)
      .respond(function(method, url, data, headers){
        log(JSON.parse(data).person.name.preferred_first);
        return [200,{}];
      });
      $httpBackend.whenGET(/.*/).passThrough();
    });
  };

  var httpBackendMockString = '(' + httpBackendMock.toString()
    .replace('// UGLY', 'var mappings = ' + JSON.stringify(mappings) + ';'
                      + 'var personId = ' + JSON.stringify(personId) + ';'
                      + 'var accessToken = ' + JSON.stringify(accessToken) + ';')
    .replace(/\s+/g,' ') + '())';
  ptor = protractor.getInstance();
  ptor.addMockModule('httpBackendMock', httpBackendMockString);
}
function logIn(personId,accessToken){
  visit('callback?person_id=' + personId + '&access_token=' + accessToken);
}

module.exports = {
  setup: setup,
  visit: visit,
  mockBackend: mockBackend,
  logIn: logIn
}
