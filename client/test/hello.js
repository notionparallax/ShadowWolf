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

  it('login button exists', function(){
    visit('people').then(function(){
      return element(by.css('.login-btn a'));
    }).then(function(login){
      return login.getInnerHtml();
    }).then(function(loginText) {
      expect(loginText).toBe('Log In');
    });
  });

  describe('people pages', function(){
    var people = [
    {
      name: { 'preferred_last': 'Test Person' },
      id: { $oid: 'test-id' }
    }];
    beforeEach(function() {
      mockBackend({'people.json' : people});
    });

    it('should list people at /people', function(){
      visit('people').then(function(){
        return element.all(by.css('.info-box'));
      }).then(function(peopleHtml){
        expect(peopleHtml.length).toBe(people.length);
      });
    });

    it('should show a "more" link when hovering on a person\'s tile', function(){
      visit('people').then(function(){
        return element(by.css('.info-box'));
      }).then(function(personBox){
        var moreButton = personBox.findElement(by.css('.info-button'));;
        return moreButton;
      }).then(function(button){
        return button.getAttribute('href');
      }).then(function(href) {
        expect(href).toMatch(people[0].id.$oid);
      });
    });

  });

  describe('projects pages', function(){
    var projects = [{ 'project_name': 'Test Project' },{ 'project_name': 'Test Project' }];
    beforeEach(function() {
      mockBackend({'projects.json' : projects});
    });

    it('projects are listed on /projects', function(){
      visit('projects').then(function(){
        return element.all(by.css('.info-box'));
      }).then(function(projectsHtml){
        //projectsHtml[0].getInnerHtml().then(console.log);
        expect(projectsHtml.length).toBe(projects.length);
      });
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
      
      xit("should NOT save the text entered if ENTER is pressed", function() {
      magicalEditableSetupFunction(someJSON, someHelpText, more, args, that, we, will, need);
      magicalEditable_gotoEditMode('selector.of.editable.we.want').then(function(edInput){
        edInput.clear();
        edInput.sendKeys("I'm typing, pretty cool eh!")
        ptor.actions().sendKeys(protractor.Key.ESCAPE).perform(); //http://stackoverflow.com/questions/19914915/how-to-make-protractor-press-the-enter-key
      }).then(function(){
        expect($('div.form-control-static.editable.editable-text')).not.toMatch("I'm typing, pretty cool eh!");
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

describe('people page tests:', function(){

    xit("should be able to see the Preferred Name section", function() {
        visit('people/bdoherty').then(function(){ //will fail becasue we don't have pretty urls, and because we don't have a magic people setup function yet
        return element.all(by.css('div > h3'));
      }).then(function(header){
        expect(projectsHtml.length).not.toBeUndefined());
      });
      });
  });

  xit("should show the culture tab when it's clicked", function() {
        visit('people/bdoherty').then(function(){ //will fail becasue we don't have pretty urls, and because we don't have a magic people setup function yet
        return element.all(by.css('body > div.container.ng-scope > article > ul > li:nth-child(2) > a'));
      }).then(function(header){
        expect(/*there to be something on the page that is cultury*/).not.toBeUndefined());
      });
      });
  });

});
