var pageObjects = require("../page_objects.js");
var DisplayBoxes = pageObjects.DisplayBoxes;
var DisplayBox = pageObjects.DisplayBox;
var LoginButton = pageObjects.LoginButton;
var Utils = require("../utils.js");
var setup = Utils.setup;
var visit = Utils.visit;
var mockBackend = Utils.mockBackend;
var mockPerson = require("../mock_person.js").mockPerson;

describe('index pages',function(){
  setup();

  describe('people page', function(){
    var people = [
      {
        name: { 'preferred_last': 'Test Person' },
        id: { $oid: 'test-id' }
      }
    ];
    var peopleTiles;
    beforeEach(function() {
      mockBackend({'people.json' : people});
      visit('people');
      peopleTiles = new DisplayBoxes();
    });

    it('should list people at /people', function(){
      expect(peopleTiles.count()).toBe(people.length);
    });

    it('should show a "more" link for a person', function(){
      var firstPeopleTile = new DisplayBox(peopleTiles.get(0));
      var moreButton = firstPeopleTile.moreButton;
      expect(moreButton.getAttribute('href')).toMatch(people[0].id.$oid);
    });

  });

  describe('projects pages', function(){
    var projects = [
      { 'project_name': 'Test Project', id: { $oid: 'TheProjectId' } },
      { 'project_name': 'Test Project' }
    ],
        projectTiles;
    beforeEach(function() {
      mockBackend({'projects.json' : projects});
      visit('projects');
      projectTiles = new DisplayBoxes();
    });

    it('projects are listed on /projects', function(){
      expect(projectTiles.count()).toBe(projects.length);
    });

    it('should show a "more" link for a project', function(){
      var firstProjectTile = new DisplayBox(projectTiles.get(0));
      var moreButton = firstProjectTile.moreButton;
      expect(moreButton.getAttribute('href')).toMatch(projects[0].id.$oid);
    });

  });
});
