var pageObjects = require("../page_objects.js");
var Utils = require("../utils.js");
var setup = Utils.setup;
var visit = Utils.visit;
var mockBackend = Utils.mockBackend;
var mockPerson = require("../mock_person.js").mockPerson;
var EditableGroup = pageObjects.EditableGroup;

describe('show pages',function(){
  setup();

  describe('general',function(){
    beforeEach(function() {
        mockBackend({'people/test' : mockPerson});
        visit('people/test-id');
    });

    xit('should not redirect when viewing a person\'s show page', function(){
      var currentUrl = browser.getCurrentUrl();
      expect(currentUrl).toMatch('people/test-id');
    });

    xit("should be able to see the Preferred Name section", function() {
      var header = element(by.css('div > h3'));
      expect(header.getText()).toMatch(/Preferred Name/);
    });
    
    xit("should be able to see the photos section", function() {
      var thumbnails = element.all(by.css('.thumbnail'));
      expect(thumbnails.count()).toBe(3);
    });

   xit("should show the culture tab when it's clicked", function() {
      var cultureTab = element(by.css('.nav-tabs li:nth-child(2) a'));
      cultureTab.click();
      var cultureTabPane = element(by.css('.tab-pane:nth-child(2)'));
      var header = cultureTabPane.findElement(by.css('h3'));
      expect(header.getText()).toMatch(/Office Culture/);
    });
  });

  describe('Permissions:', function(){
    describe('Guest:',function(){
      beforeEach(function(){
        mockBackend(
          {
            'people/test-id' :
              {
                guest: mockPerson
              }
          }, 'test-id', 'test-token');
        visit('people/test-id');
      });
      it('should not show the mobile number', function(){
        element(by.linkText('Contact')).click()
        //var mobileEditable = new EditableGroup('employee.contact.mobile');
        expect(false).toBe(true);
      });
      xit('should not show the finance info', function(){
        expect(false).toBe(true);
      });
      xit('should not show the travel tab', function(){
        expect(false).toBe(true);
      });
      xit('should not show the applicant tab', function(){
        expect(false).toBe(true);
      });
    });
    describe('Logged in different user',function(){
      xit('should not show the mobile number', function(){
        expect(false).toBe(true);
      });
      xit('should not show the finance info', function(){
        expect(false).toBe(true);
      });
      xit('should not show the travel tab', function(){
        expect(false).toBe(true);
      });
      xit('should not show the applicant tab', function(){
        expect(false).toBe(true);
      });
    });
  });
});
