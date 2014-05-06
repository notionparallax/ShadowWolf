var mockPerson = require("./mockPerson.js").ben;

describe('initial tests:',function(){
  function visit(path) {
    var url = 'http://'
      + process.env['CLIENT_PORT_9000_TCP_ADDR']
      + ':'
      + process.env['CLIENT_PORT_9000_TCP_PORT']
      + '/#/'
      + path;
    return browser.get(url);
  }
  function mockBackend(mappings) {
    /* This is pretty revolting. Dave made an issue here:
       https://github.com/angular/protractor/issues/695*/
    var httpBackendMock = function(){
      angular.module('httpBackendMock', ['ShadowWolf', 'ngMockE2E'])
      .run(function($httpBackend) {
        // UGLY
        for (var regex in mappings) {
          $httpBackend.whenGET(new RegExp(regex))
            .respond(mappings[regex]);
        }
        $httpBackend.whenGET(/.*/).passThrough();
      });
    };

    var httpBackendMockString = '(' + httpBackendMock.toString()
      .replace('// UGLY', 'var mappings = ' + JSON.stringify(mappings) + ';')
      .replace(/\s+/g,' ') + '())';
    ptor = protractor.getInstance();
    ptor.addMockModule('httpBackendMock', httpBackendMockString);
  }

  function LoginButton() {
    var _button = element(by.css('.login-btn a'));
    this.click = _button.click;
    this.getText = _button.getInnerHtml;
  }
  it('login button exists', function(){
    visit('people');
    var loginBtn = new LoginButton();
    expect(loginBtn.getText()).toBe('Log In');
  });

  function DisplayBoxes() {
    var _tiles = element.all(by.css('.info-box'));
    this.count = _tiles.count;
    this.get = _tiles.get;
  }
  function DisplayBox(box) {
    this.moreButton = box.findElement(by.css('.more-button'));
  }
  describe('people index page', function(){
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
  
  describe('editable tests', function(){

    xit("should show help text when a label is hovered", function() {
      //Where helptext container is called `x`
      magicalEditableSetupFunction(someJSON, someHelpText, more, args, that, we, will, need);
      $('label.editable-lable"').trigger('mouseover');
      expect($('#helptext-for-x')).toBeHidden();
      $('label.editable-lable"').trigger('mouseout');
      expect($('#helptext-for-x')).toBeShown();
    });

    xit("should save the text entered if ENTER is pressed", function() {
      magicalEditableSetupFunction(someJSON, someHelpText, more, args, that, we, will, need);
      magicalEditable_gotoEditMode('selector.of.editable.we.want').then(function(edInput){
        edInput.clear();
        edInput.sendKeys("I'm typing, pretty cool eh!")
        ptor.actions().sendKeys(protractor.Key.ENTER).perform(); //http://stackoverflow.com/questions/19914915/how-to-make-protractor-press-the-enter-key
      }).then(function(){
        expect($('div.form-control-static.editable.editable-text')).toMatch("I'm typing, pretty cool eh!");
      });
    });
      
    xit("should NOT save the text entered if ENTER is pressed", function() {
      magicalEditableSetupFunction(someJSON, someHelpText, more, args, that, we, will, need);
      magicalEditable_gotoEditMode('selector.of.editable.we.want').then(function(edInput){
        edInput.clear();
        edInput.sendKeys("I'm typing, pretty cool eh!")
        ptor.actions().sendKeys(protractor.Key.ESCAPE).perform(); //http://stackoverflow.com/questions/19914915/how-to-make-protractor-press-the-enter-key
      }).then(function(){
        expect($('div.form-control-static.editable.editable-text')).not.toMatch("I'm typing, pretty cool eh!");
      });
    });
      
    xit("should NOT allow 'conditions' not on the list", function() {
      magicalEditableSetupFunction(someJSON, someHelpText, more, args, that, we, will, need);
      magicalEditable_gotoEditMode('selector.of.editable.we.want').then(function(edInput){
        edInput.clear();
        edInput.sendKeys("poopy fart face")
        ptor.actions().sendKeys(protractor.Key.ENTER).perform();
      }).then(function(){
        expect("the server to tell us that it's not happy"); //#92
      });
    });
      
    xit("should allow 'conditions' on the list", function() {
      magicalEditableSetupFunction(someJSON, someHelpText, more, args, that, we, will, need);
      magicalEditable_gotoEditMode('selector.of.editable.we.want').then(function(edInput){
        edInput.clear();
        edInput.sendKeys("active")
        ptor.actions().sendKeys(protractor.Key.ENTER).perform();
      }).then(function(){
        expect("the server to tell us that it is happy"); //#92
      });
    });

  });

  describe('person show page', function(){
    var people = [
    {
      name: { 'preferred_last': 'Test Person' },
      id: { $oid: 'test-id' }
    }];
    beforeEach(function() {
      mockBackend({'people.json' : people});
      visit('people/test-id');
    });

    describe('editables in show page', function(){
      function Editable(property){
      }
      function EditableGroup(lens){
        var _element = element(by.css('editable-group'));
        _element.getOuterHtml(function(x){
          console.log(_element);
        });
      }
      var preferredFirstEditable;
      beforeEach(function(){
        // find an editable
      });

      it("should save the text entered if ENTER is pressed", function() {
        var nameGroup = new EditableGroup('name');
        expect(false).toBe(true);
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

});
