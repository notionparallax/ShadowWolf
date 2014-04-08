describe('initial tests',function(){
  function visit(path) {
    var url = 'http://'
      + process.env['CLIENT_PORT_9000_TCP_ADDR']
      + ':'
      + process.env['CLIENT_PORT_9000_TCP_PORT']
      + '/#/'
      + path;
    return browser.get(url);
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

  describe('mocks data', function(){
    var httpBackendMock = function(){
      console.log("hellohello");
      angular.module('httpBackendMock', ['ShadowWolf', 'ngMockE2E'])
      .run(function($httpBackend) {
        var person = { name: { 'preferred_last': 'gvhbjn' } };
        $httpBackend.whenGET(/people.json/).respond([person]);
        $httpBackend.whenGET(/.*/).passThrough();
      });
    };
    ptor = protractor.getInstance();
    ptor.addMockModule('httpBackendMock', httpBackendMock);

    it('people are listed on /people', function(){
      visit('people').then(function(){
        return element.all(by.css('.test'));
      }).then(function(rows){
        console.log(rows);
        rows[0].getInnerHtml().then(function(html){
          console.log("async");
          console.log(html);
        });
        expect(false);
        expect(rows.length).toBeGreaterThan(0);
      });
    });
  });


});
