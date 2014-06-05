var pageObjects = require("../page_objects.js");
var EditableGroup = pageObjects.EditableGroup;
var Utils = require("../utils.js");
var setup = Utils.setup;
var visit = Utils.visit;
var mockBackend = Utils.mockBackend;
var mockPerson = require("../mock_person.js").mockPerson;

describe('editables in show page', function(){
  setup();
  beforeEach(function() {
      mockBackend({'people/test' : mockPerson },
        'test-id', 'test-token');
      visit('callback?person_id=test-it&access_token=test-token');
      visit('people/test-id');
  });

  xit("should display correct values for textual properties", function() {
    var nameEditableGroup = new EditableGroup('name');

    var preferedFirstEditable = nameEditableGroup.getEditable('preferred_first');
    expect(preferedFirstEditable.getValue()).toBe('Ben');

    var preferedLastEditable = nameEditableGroup.getEditable('preferred_last');
    expect(preferedLastEditable.getValue()).toBe('Doherty');
  });

  xit("should go to InputMode if clicked in OutputMode", function(){
    var nameEditableGroup = new EditableGroup('name');
    var preferedFirstEditable = nameEditableGroup.getEditable('preferred_first');

    preferedFirstEditable.click();
    expect(preferedFirstEditable.isInputMode()).toBe(true);

    var editableInputElement = preferedFirstEditable.getInputElement();
    var activeElement = ptor.driver.switchTo().activeElement();
    expect(activeElement.getOuterHtml()).toBe(editableInputElement.getOuterHtml());
  });

  xit("should go to OutputMode if ENTER is pressed in InputMode", function() {
    var nameEditableGroup = new EditableGroup('name');
    var preferedFirstEditable = nameEditableGroup.getEditable('preferred_first');
    expect(preferedFirstEditable.isOutputMode()).toBe(true);
    preferedFirstEditable.click();
    expect(preferedFirstEditable.isInputMode()).toBe(true);
    ptor.actions().sendKeys(protractor.Key.ENTER).perform();
    expect(preferedFirstEditable.isOutputMode()).toBe(true);
  });

  it("should PATCH data to the server when a field is changed", function() {
    // mock stuff
//    ptor = protractor.getInstance();
//    ptor.addMockModule('httpBackendMock', function(){
//      angular.module('httpBackendMock', ['ShadowWolf','ngMockE2E'])
//      .run(function($httpBackend, $document) {
//        function log(msg) {
//          $document.append('<p class="log">' + msg + '</p>');
//        }
//        $httpBackend.whenGET(/people/)
//          .respond({person: mockPerson});
//        $httpBackend.whenGET(/.*/)
//        .respond(function(method,url,data,headers){
//          if (data.name.preferred_first == 'OK') {
//            log('success');
//          } else {
//            log('fail');
//          }
//        });
//      });
//    });

    // enter data
    var nameEditableGroup = new EditableGroup('name');
    var preferedFirstEditable = nameEditableGroup.getEditable('preferred_first');
    preferedFirstEditable.click();
    var inputE = preferedFirstEditable.getInputElement();
    preferedFirstEditable.sendKeys('OK');
    // submit
    preferedFirstEditable.submit();
    expect(preferedFirstEditable.getHtml()).toBe('editable html')
    // verify success
    element.all(by.css('.log'))
      .then(function(logs){
        for (var log in logs) {
          expect(logs[log].getInnerHtml()).toBe('log' + log);
        }
      });
    browser.manage().logs().get('browser').then(function(browserLog) {
        console.log('log: ' + require('util').inspect(browserLog));
    });
  });
    /*
    magicalEditableSetupFunction(someJSON, someHelpText, more, args, that, we, will, need);
    magicalEditable_gotoEditMode('selector.of.editable.we.want').then(function(edInput){
      edInput.clear();
      edInput.sendKeys("I'm typing, pretty cool eh!")
      ptor.actions().sendKeys(protractor.Key.ENTER).perform(); //http://stackoverflow.com/questions/19914915/how-to-make-protractor-press-the-enter-key
    }).then(function(){
      expect($('div.form-control-static.editable.editable-text')).toMatch("I'm typing, pretty cool eh!");
    });
    */

});
