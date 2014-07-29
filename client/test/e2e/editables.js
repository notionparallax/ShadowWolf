var pageObjects = require("../page_objects.js");
var EditableGroup = pageObjects.EditableGroup;
var BackEndLogs = pageObjects.BackEndLogs;
var Utils = require("../utils.js");
var setup = Utils.setup;
var visit = Utils.visit;
var mockBackend = Utils.mockBackend;
var mockPerson = require("../mock_person.js").mockPerson;
var mockProject = require("../mock_project.js").mockProject;

describe('editables in show page', function(){
  setup();
  beforeEach(function(){
    mockBackend({'people/test' : mockPerson },
      'test-id', 'test-token');
    visit('callback?person_id=test-id&access_token=test-token&login=test-login');
    visit('people/test-id');
  });

   it("should display correct values for textual properties", function() {
    var nameEditableGroup = new EditableGroup('name');

    var preferedFirstEditable = nameEditableGroup.getEditable('preferred_first');
    expect(preferedFirstEditable.getValue()).toBe('Ben');

    var preferedLastEditable = nameEditableGroup.getEditable('preferred_last');
    expect(preferedLastEditable.getValue()).toBe('Doherty');
  });

   it("should go to InputMode if clicked in OutputMode", function(){
    var nameEditableGroup = new EditableGroup('name');
    var preferedFirstEditable = nameEditableGroup.getEditable('preferred_first');

    preferedFirstEditable.click();
    expect(preferedFirstEditable.isInputMode()).toBe(true);

    var editableInputElement = preferedFirstEditable.getInputElement();
    var activeElement = ptor.driver.switchTo().activeElement();
    expect(activeElement.getOuterHtml()).toBe(editableInputElement.getOuterHtml());
  });

   it("should go to OutputMode if ENTER is pressed in InputMode", function() {
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

  it('should properly set when type=tel', function(){
    element(by.cssContainingText('a','Contact')).click();
    var employeeContact = new EditableGroup('employee.contact.mobile');
    var number = employeeContact.getEditable('number');
    number.click();
    number.sendKeys('\b\b\b456');
    number.submit();
    expect(number.getValue()).toBe('456');
    // verify success
    var logs = new BackEndLogs().fetchRequests();
    var match = function(log) {
      return log.method == 'PATCH' &&
        JSON.parse(log.data)
          .person.employee.contact.mobile.number === '456';
    };
    logs.then(function(logs){
      expect(logs.some(match)).toBe(true);
    });
  });
  it('should properly set when type=number', function(){
    element(by.cssContainingText('a','Contact')).click();
    var employeeContact = new EditableGroup('employee.contact');
    var extension = employeeContact.getEditable('extension');
    extension.click();
    extension.sendKeys('\b\b\b456');
    extension.submit();
    expect(extension.getValue()).toBe('456');
    // verify success
    var logs = new BackEndLogs().fetchRequests();
    var match = function(log) {
      return log.method == 'PATCH' &&
        JSON.parse(log.data)
          .person.employee.contact.extension === 456;
    };
    logs.then(function(logs){
      expect(logs.some(match)).toBe(true);
    });
  });

  it('should properly set when type=boolean', function(){
    element(by.cssContainingText('a','Contact')).click();
    var employeeContact = new EditableGroup('employee.contact.mobile');
    var isWork = employeeContact.getEditable('is_work');
    isWork.click();
    isWork.sendKeys(protractor.Key.SPACE);
    isWork.submit();
    expect(isWork.getValue()).toBe('No');
    // verify success
    var logs = new BackEndLogs().fetchRequests();
    var match = function(log) {
      return log.method == 'PATCH' &&
        JSON.parse(log.data)
          .person.employee.contact.mobile.is_work === false;
    };
    logs.then(function(logs){
      expect(logs.some(match)).toBe(true);
    });
  });

});
describe('editables on projects show page', function(){
  setup();
  beforeEach(function(){
    mockBackend(
      {
        'people/test' : mockPerson,
        'projects/test' : mockProject
      },
      'test-id', 'test-token');
    visit('callback?person_id=test-id&access_token=test-token');
    visit('projects/test-id');
  });
});
