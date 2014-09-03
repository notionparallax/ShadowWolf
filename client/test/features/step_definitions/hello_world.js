var chai = require('chai');
var chaiAsPromised = require('chai-as-promised');
chai.use(chaiAsPromised);
var expect = chai.expect;
var baseUrl = 'http://localhost:9000/';

function helloWorldWrapper() {
  browser.ignoreSynchronization = true;
  this.after = (function(end){
    browser.manage().logs().get('browser').then(function(browserLogs) {
         // browserLogs is an array of objects with level and message fields
      browserLogs.forEach(function(log){
        console.log();
        console.log(log.message);
      });
      end();
    });
  });

  this.Given(/^I am on the (.*) index$/, function(indexName, next) {
    browser.get(baseUrl + '#/' + indexName)
    .then(function(){
      return browser.sleep(2000);
    }).then(next);
  });

  var numberOfThings;
  this.Given(/^the database contains certain (.*)$/, function(whatever, next) {
    element.all(By.css('.info-box')).count()
      .then(function(count) {
        numberOfThings = count;
    }).then(next);
  });

  this.Given(/^there is a (.*) display box$/, function(displayBoxType, next) {
    browser.get(baseUrl + '#/' + displayBoxType)
      .then(function(){
        return browser.sleep(2000);
      }).then(function(){
        next();
      });
  });

  this.Then(/the person\'s name should be visible/, function(next) {
    var personsName = element.all(By.css('[ng-repeat] a h1')).first();
    expect(personsName.isDisplayed()).to.eventually.equal(true)
    .and.notify(next);
  });

  this.Then(/^the displayed (.*) should change accordingly$/, function(whatever, next) {
    var newNumberOfThings = element.all(By.css('.info-box')).count();
    expect(newNumberOfThings).to.not.eventually.equal(numberOfThings)
      .and.notify(next);
  });

  this.When(/^I type into the search bar$/, function(next) {
    element(By.css('.filter-box'))
      .sendKeys('1999')
      .then(next);
  });


  var redirectUrl;
  this.When(/^I click on a person$/, function(next) {
    element.all(By.css('div[ng-repeat] a'))
    .then(function(displayBoxes){
      var displayBox = displayBoxes[0];
      displayBox.getAttribute('ng-href').then(function(href) {
        redirectUrl = href;
        displayBox.click()
        .then(next);
      });
    });
  });

  this.Then(/^I should be redirected to the person\'s summary page$/, function(next) {
    browser.getCurrentUrl().then(function(url){
      expect(url).to.contain(redirectUrl);
      next();
    });
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
    callback.pending();
  });

  this.When(/^I go to the project index$/, function(callback) {
    callback.pending();
  });

  this.When(/^I click on a project$/, function(callback) {
    callback.pending();
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
