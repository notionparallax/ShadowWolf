var chai = require('chai');
var chaiAsPromised = require('chai-as-promised');
chai.use(chaiAsPromised);
var expect = chai.expect;

function helloWorldWrapper() {

  this.Given(/^I am a logged in average user$/, function(callback) {
    browser.ignoreSynchronization = true;
    callback();
  });

  this.When(/^I go to the project index$/, function(callback) {
    browser.get('http://localhost:3000')
    .then(function(){
      callback();
    });
  });

  this.When(/^I click on a project$/, function(callback) {
    expect(browser.getTitle()).to.eventually.equal('').and.notify(callback);
  });

  this.Then(/^I should be redirected to the project\'s summary page$/, function(greeting, callback) {
    callback.pending();
  });

  this.When(/I go to a project page/, function(callback) {
    callback.pending();
  });

  this.Then(/I should be able to see the people who worked on this project/, function(callback) {
    callback.pending();
  });
}

module.exports = helloWorldWrapper;
