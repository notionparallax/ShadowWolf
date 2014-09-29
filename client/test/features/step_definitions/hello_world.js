var chai = require('chai');
var chaiAsPromised = require('chai-as-promised');
chai.use(chaiAsPromised);
var expect = chai.expect;
var baseUrl = 'http://localhost:9000/';

function helloWorldWrapper() {
  function pass(next) { next(); }
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

  this.Given(/^I am an average user$/, pass);
  this.Given(/^I am on the (.*) index$/, function(modelType, next) {
    browser.get(baseUrl + '#/' + modelType)
    .then(next);
  });

  this.Given(/^I have already visited the (.*) index$/, function(model,next) {
    browser.get(baseUrl + '#/' + model)
    .then(next);
  });

  this.When(/^I refresh the page$/, function(next) {
    browser.navigate().refresh()
      .then(function(){
        next();
      });
  });

  this.Then(/^the localstorage should be set with (.*) in it$/, function(model,next) {
    browser.executeScript('return window.localStorage.' + model)
      .then(function(result){
          expect(JSON.parse(result).length).to.be.above(0);
          expect(JSON.parse(result)[0].id).to.not.equal(undefined);
          expect(JSON.stringify(JSON.parse(result)[0].id)).to.not.equal("{}");
          next();
        });
  });

  this.Then(/^I should see (.*) photos within 2 seconds$/, function(modelType, next) {
    setTimeout(function() {
      element.all(By.css('.info-box h1')).first()
        .getText().then(function(title) {
            expect(title).to.not.equal('');
            next();
          });
    }, 2000);
  });

  this.When(/^the page first loads$/, function(next) {
    next();
  });

  this.Then(/^the search bar should have focus$/, function(next) {
    element(By.css('.filter-box')).getAttribute('id')
    .then(function(searchBarId){
      var activeElementId = browser.driver.switchTo().activeElement().getAttribute('id');
      expect(activeElementId).to.eventually.equal(searchBarId).and.notify(next);
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
    function testIfDisplayed(el) {
      return el.isDisplayed()
        .thenCatch(function(staleElement){
          return browser.sleep(1000).then(function(){
            return testIfDisplayed(el);
          });
        });
    }
    testIfDisplayed(personsName).then(function(){
      expect(personsName.isDisplayed()).to.eventually.equal(true)
      .and.notify(next);
    });
  });
  
  var person;
  this.Given(/^the person is not active$/, function (next) {
    person = element.all(By.css('.info-box:not(.Active)')).first();
    person.then(next);
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
    browser.sleep(2000).then(function(){
      element.all(By.css('div[ng-repeat] a')).first()
      .then(function(displayBox){
        displayBox.getAttribute('ng-href').then(function(href) {
          redirectUrl = href;
          displayBox.click()
          .then(next);
        });
      });
    });
  });

  this.When(/^I hover my mouse over it$/, function(next) {
    browser.sleep(2000).then(function(){
      var it = element.all(By.css('.info-box')).first();
      browser.actions().mouseMove(it).perform().then(next);
    });
  });

  this.Then(/^I should be able to see its project (.*)$/, function (thing, next) {
    next.pending();
    var visible = element.all(By.css('.info-box')).first()
      .element(By.css('.details')).isDisplayed();
    next.pending();
    //expect(visible).to.eventually.equal(true).and.notify(next);
  });

  this.Then(/^I should be able to see their current condition$/, function (next) {
    var visible = element.all(By.css('.info-box')).first()
      .element(By.css('.details')).isDisplayed();
    next.pending();
    //expect(visible).to.eventually.equal(true).and.notify(next);
  });

  this.Then(/^I should be able to see their extension$/, function (next) {
    var visible = element.all(By.css('.info-box')).first()
      .element(By.css('.details')).isDisplayed();
    expect(visible).to.eventually.equal(true).and.notify(next);
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
