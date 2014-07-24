var pageObjects = require("../page_objects.js");
var Utils = require("../utils.js");
var setup = Utils.setup;
var visit = Utils.visit;
var mockBackend = Utils.mockBackend;
var mockProject = require("../mock_project.js").mockProject;
var mockPerson = require("../mock_person.js").mockPerson;
var EditableGroup = pageObjects.EditableGroup;

describe('project show page', function(){
  setup();

  describe('general', function(){
    beforeEach(function(){
      mockBackend(
        { 
          'people/test-id' : mockPerson,
          'projects/test-id': mockProject
        }, 'test-id', 'test-token');
      // login
      visit('callback?access_token=test-token&person_id=test-id&login=test-login');
      visit('projects/test-id');
    });

    it('should show the project number', function() {
      var header = element(by.css('h1 small'));
      expect(header.getText()).toEqual('test-number');
    });
  });
});
