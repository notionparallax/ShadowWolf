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
function mockBackend(mappings) {
  /* This is pretty revolting. Dave made an issue here:
     https://github.com/angular/protractor/issues/695*/
  var httpBackendMock = function(){
    angular.module('httpBackendMock', ['ShadowWolf', 'ngMockE2E'])
    .run(function($httpBackend) {
      // UGLY
      for (var regex in mappings) {
        $httpBackend.whenGET(new RegExp(regex))
          .respond(mappings[regex]);
      }
      $httpBackend.whenGET(/.*/).passThrough();
    });
  };

  var httpBackendMockString = '(' + httpBackendMock.toString()
    .replace('// UGLY', 'var mappings = ' + JSON.stringify(mappings) + ';')
    .replace(/\s+/g,' ') + '())';
  ptor = protractor.getInstance();
  ptor.addMockModule('httpBackendMock', httpBackendMockString);
}

module.exports = {
  setup: setup,
  visit: visit,
  mockBackend: mockBackend
}
