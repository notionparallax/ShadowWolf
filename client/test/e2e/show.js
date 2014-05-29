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

    it('should not redirect when viewing a person\'s show page', function(){
      var currentUrl = browser.getCurrentUrl();
      expect(currentUrl).toMatch('people/test-id');
    });

    it("should be able to see the Preferred Name section", function() {
      var header = element(by.css('div > h3'));
      expect(header.getText()).toMatch(/Preferred Name/);
    });
    
    it("should be able to see the photos section", function() {
      var thumbnails = element.all(by.css('.thumbnail'));
      expect(thumbnails.count()).toBe(3);
    });

   it("should show the culture tab when it's clicked", function() {
      var cultureTab = element(by.css('.nav-tabs li:nth-child(2) a'));
      cultureTab.click();
      var cultureTabPane = element(by.css('.tab-pane:nth-child(2)'));
      var header = cultureTabPane.findElement(by.css('h3'));
      expect(header.getText()).toMatch(/Office Culture/);
    });
  });

  describe('Permissions:', function(){
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

    describe('Guest:',function(){
      it('should not show the mobile number', function(){
        element(by.linkText('Contact')).click();
        var mobileDiv = element(by.id('mobile'));
        expect(mobileDiv.isPresent()).toBe(true);
      });
      it('should not show the finance info', function(){
        var financeHeader = element(by.css('h3#finance'));
        expect(financeHeader.isPresent()).toBe(false);
      });
      it('should not show the travel tab', function(){
        var travelTab = element(by.linkText('Travel'));
        expect(travelTab.isPresent()).toBe(false);
      });
      it('should not show the applicant tab', function(){
        var applicantTab = element(by.linkText('Applicant'));
        expect(applicantTab.isPresent()).toBe(false);
      });
    });
    describe('Logged in different user',function(){
      beforeEach(function(){
        // log in as different user to one whose page we're using
        visit('callback?access_token=test-token&person_id=not-test-id');
        visit('people/test-id');
      });
      it('should not show the mobile number', function(){
        element(by.linkText('Contact')).click();
        var mobileDiv = element(by.id('mobile'));
        expect(mobileDiv.isPresent()).toBe(true);
      });
      it('should not show the finance info', function(){
        var financeHeader = element(by.css('h3#finance'));
        expect(financeHeader.isPresent()).toBe(false);
      });
      it('should not show the travel tab', function(){
        var travelTab = element(by.linkText('Travel'));
        expect(travelTab.isPresent()).toBe(false);
      });
      it('should not show the applicant tab', function(){
        var applicantTab = element(by.linkText('Applicant'));
        expect(applicantTab.isPresent()).toBe(false);
      });
    });
  });
});
