function helloWorldWrapper() {
  this.World = require('../support/world.js').World;

  this.Given(/^I am an average user$/, function(callback) {
    callback();
  });

  this.When(/^I go to the main page$/, function(callback) {
    this.browser.visit('http://www.google.com/', callback);
  });

  this.Then(/^I should see "([^"]*)" on the page\.$/, function(greeting, callback) {
    this.browser.text('body').should.include.string(greeting);
    callback();
  });
}

module.exports = helloWorldWrapper;
