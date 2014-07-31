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
    var nameGroup = new EditableGroup('name');

    var preferedFirst = nameGroup.getEditable('preferred_first');
    expect(preferedFirst.getValue()).toBe('Ben');

    var preferedLast = nameGroup.getEditable('preferred_last');
    expect(preferedLast.getValue()).toBe('Doherty');
  });

  it("should go to InputMode if clicked in OutputMode", function(){
    var nameGroup = new EditableGroup('name');
    var preferedFirst = nameGroup.getEditable('preferred_first');

    preferedFirst.click();
    expect(preferedFirst.isInputMode()).toBe(true);

    var editableInputElement = preferedFirst.getInputElement();
    var activeElement = ptor.driver.switchTo().activeElement();
    expect(activeElement.getOuterHtml()).toBe(editableInputElement.getOuterHtml());
  });

  it("should go to OutputMode if ENTER is pressed in InputMode", function() {
    var nameGroup = new EditableGroup('name');
    var preferedFirst = nameGroup.getEditable('preferred_first');
    expect(preferedFirst.isOutputMode()).toBe(true);
    preferedFirst.click();
    expect(preferedFirst.isInputMode()).toBe(true);
    ptor.actions().sendKeys(protractor.Key.ENTER).perform();
    expect(preferedFirst.isOutputMode()).toBe(true);
  });

  it("should PATCH data to the server when a field is changed", function() {
    var nameGroup = new EditableGroup('name');
    var preferedFirst = nameGroup.getEditable('preferred_first');
    preferedFirst.click();
    preferedFirst.sendKeys('\b\b\bOK');
    preferedFirst.submit();
    expect(preferedFirst.getValue()).toBe('OK');
    Utils.checkPatchData(function(data) { return data.
      person.name.preferred_first == 'OK';
    });
  });

  it('should properly set when type=tel', function(){
    Utils.selectTab('Contact');
    var employeeContact = new EditableGroup('employee.contact.mobile');
    var number = employeeContact.getEditable('number');
    number.click();
    number.sendKeys('\b\b\b456');
    number.submit();
    expect(number.getValue()).toBe('456');
    Utils.checkPatchData(function(data) { return data.
      person.employee.contact.mobile.number === '456';
    });
  });

  it('should properly set when type=number', function(){
    Utils.selectTab('Contact');
    var employeeContact = new EditableGroup('employee.contact');
    var extension = employeeContact.getEditable('extension');
    extension.click();
    extension.sendKeys('\b\b\b456');
    extension.submit();
    expect(extension.getValue()).toBe('456');
    Utils.checkPatchData(function(data) { return data.
      person.employee.contact.extension === 456;
    });
  });

  it('should properly set when type=boolean', function(){
    Utils.selectTab('Contact');
    var employeeContact = new EditableGroup('employee.contact.mobile');
    var isWork = employeeContact.getEditable('is_work');
    isWork.click();
    isWork.sendKeys(protractor.Key.SPACE);
    isWork.submit();
    expect(isWork.getValue()).toBe('No');
    Utils.checkPatchData(function(data) { return data.
      person.employee.contact.mobile.is_work === false;
    });
  });

  it('type=tel should accept +, space, - and ()', function(){
    Utils.selectTab('Contact');
    var employeeContact = new EditableGroup('employee.contact.mobile');
    var number = employeeContact.getEditable('number');
    number.click();
    number.sendKeys('\b\b\b(+61) 444-222');
    number.submit();
    expect(number.getValue()).toBe('(+61) 444-222');
    Utils.checkPatchData(function(data){ return data.
      person.employee.contact.mobile.number === '(+61) 444-222';
    });
  });

  it('should properly set when type=date', function(){
    Utils.selectTab('Name');
    var employeeContact = new EditableGroup('conditions');
    var startDate = employeeContact.getEditable('start_date');
    ptor.executeScript('window.scrollTo(0,500);');
    startDate.click();
    startDate.sendKeys('\b\b10');
    startDate.submit();
    expect(startDate.getValue()).toBe('2010-05-10');
    Utils.checkPatchData(function(data) { return data.
      person.conditions[0].start_date === '2010-05-10';
    });
  });

  it('should not print "null" when the value is null', function(){
    Utils.selectTab('Bio');
    var biographyGroup = new EditableGroup('employee.biography');
    var approach = biographyGroup.getEditable('approach');
    expect(approach.getValue()).not.toBe('null');
  });
});
