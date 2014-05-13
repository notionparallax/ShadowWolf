var pageObjects = require("../page_objects.js");
var LoginButton = pageObjects.LoginButton;
var Utils = require("../utils.js");
var mockBackend = Utils.mockBackend;
var setup = Utils.setup;
var visit = Utils.visit;

describe('general',function(){
  setup();

  it('login button exists', function(){
    visit('people');
    var loginBtn = new LoginButton();
    expect(loginBtn.getText()).toBe('Log In');
  });
  it('login works when you go to the login url', function(){
    Utils.logIn('test-id', 'test-token');
    var btn = element(by.css('.login-btn'));
    expect(ptor.getCurrentUrl()).toBe(true);
    expect(btn.getOuterHtml()).toBe(true);
  });
});
