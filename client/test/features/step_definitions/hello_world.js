var chai = require('chai');
var chaiAsPromised = require('chai-as-promised');
chai.use(chaiAsPromised);
var expect = chai.expect;
var baseUrl = 'http://localhost:9000/';

function helloWorldWrapper() {

  this.Given(/^I am on the project index$/, function(next) {
    browser.get(baseUrl + '#/projects')
    .then(next);
  });

  this.When(/^I type into the search bar$/, function(next) {
    element(By.css('.filter-box'))
      .sendKeys('1999')
      .then(next);
  });

  this.Then(/^the displayed projects should change accordingly/, function(next){
    expect(element.all(By.css('.info-box')).count()).to.eventually.equal(1).and.notify(next);
  });

  this.Given(/^I am on a person\'s page$/, function(next){
    browser.get(baseUrl + '#/people')
      .then(function(){
        return browser.sleep(3000);
      }).then(function(){
        return element.all(By.css('div[ng-repeat] a')).first();
      }).then(function(displayBox) {
        return displayBox.click();
      }).then(next);
  });

  this.Then(/^I want to be seeing their summary page$/,function(next){
    var activeTabHeading = element(By.css('.nav-tabs li.active a')).getInnerHtml();
    expect(activeTabHeading).to.eventually.equal('Summary').and.notify(next);
  });

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
