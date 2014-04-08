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
});
