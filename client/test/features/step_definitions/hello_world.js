function helloWorldWrapper() {
  this.World = require('../support/world.js').World;

  this.Given(/^I am an average user$/, function(callback) {
    callback();
  });

  this.When(/^I go to the main page$/, function(callback) {
    this.browser.visit('http://localhost:9000/', callback);
  });

  this.Then(/^I should see "([^"]*)" on the page\.$/, function(greeting, callback) {
    console.log(this.browser.text('body'));
    callback();
  });
}

module.exports = helloWorldWrapper;
