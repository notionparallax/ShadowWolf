var pageObjects = require("../page_objects.js");
var EditableGroup = pageObjects.EditableGroup;
var BackEndLogs = pageObjects.BackEndLogs;
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
    // enter data and submit
    var nameEditableGroup = new EditableGroup('name');
    var preferedFirstEditable = nameEditableGroup.getEditable('preferred_first');
    preferedFirstEditable.click();
    preferedFirstEditable.sendKeys('\b\b\bOK');
    preferedFirstEditable.submit();
    expect(preferedFirstEditable.getValue()).toBe('OK');
    // verify success
    var logs = new BackEndLogs().fetchRequests();
    var match = function(log) {
      return log.method == 'PATCH' &&
        JSON.parse(log.data)
          .person.name.preferred_first == 'OK';
    };
    logs.then(function(logs){
      expect(logs.some(match)).toBe(true);
    });
  });

});
