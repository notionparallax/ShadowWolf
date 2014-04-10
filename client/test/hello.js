var mockPerson = require("./mockPerson.js").ben;

describe('initial tests:',function(){
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

  it('login button exists', function(){
    visit('people').then(function(){
      return element(by.css('.login-btn a'));
    }).then(function(login){
      return login.getInnerHtml();
    }).then(function(loginText) {
      expect(loginText).toBe('Log In');
    });
  });

  describe('people pages', function(){
    var people = [{ name: { 'preferred_last': 'Test Person' } }];
    beforeEach(function() {
      mockBackend({'people.json' : people});
    });

    it('people are listed on /people', function(){
      visit('people').then(function(){
        return element.all(by.css('.info-box'));
      }).then(function(peopleHtml){
        expect(peopleHtml.length).toBe(people.length);
      });
    });

  });

  describe('projects pages', function(){
    var projects = [{ 'project_name': 'Test Project' },{ 'project_name': 'Test Project' }];
    beforeEach(function() {
      mockBackend({'projects.json' : projects});
    });

    it('projects are listed on /projects', function(){
      visit('projects').then(function(){
        return element.all(by.css('.info-box'));
      }).then(function(projectsHtml){
        //projectsHtml[0].getInnerHtml().then(console.log);
        expect(projectsHtml.length).toBe(projects.length);
      });
    });
  });

});
