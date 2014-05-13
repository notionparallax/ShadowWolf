var pageObjects = require("../page_objects.js");
var Utils = require("../utils.js");
var setup = Utils.setup;
var visit = Utils.visit;
var mockBackend = Utils.mockBackend;
var mockPerson = require("../mock_person.js").mockPerson;

describe('show pages',function(){
  setup();

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
