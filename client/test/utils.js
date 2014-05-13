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
   * This is pretty revolting. Dave made an issue here:
   *   https://github.com/angular/protractor/issues/695
   * See a PR to fix here:
   *   https://github.com/angular/protractor/pull/787
   */
      
  var httpBackendMock = function(){
    angular.module('httpBackendMock', ['ShadowWolf', 'ngMockE2E'])
    .run(function($httpBackend) {
      // UGLY
      for (var regex in mappings) {
        $httpBackend.whenGET(new RegExp(regex))
          .respond(function(){
            if (personId && accessToken) {
              // check for presence of accessToken
              // check that personId matches
              // gives 3 tiers of permissions
            } else {
              return mappings[regex];
            }
          });
      }
  //    if (personId) {
  //      $httpBackend.whenGET(new RegExp('/people/auth/'))
  //        .respond(function(){
  //          return [303
  //                 ,'access_token=test&person_id=' + personId
  //                 ,{'Location': '/#/callback'}];
  //        });
  //    }
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
function logIn(personId){
  // 1. mock the backend to intercept login request
  // 2. click on login button
  visit('callback?person_id=' + personId + '&access_token=test-token');
  // 3. get redirected to home page with successful login and access token in session service
  // 
}

module.exports = {
  setup: setup,
  visit: visit,
  mockBackend: mockBackend,
  logIn: logIn
}
