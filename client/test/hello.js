describe('stuff',function(){
  it('more stuff', function(){
    var b = browser.get('http://172.17.0.5:9000/#/people');
    b.then(function(){
      var navbar = element(by.id('bs-example-navbar-collapse-1'));
      console.log("async0");
      console.log(navbar);
      return navbar.getInnerHtml();
    }).then(function(navbar){
      console.log("async");
      console.log(navbar);
    });
    var navbar = element(by.id('bs-example-navbar-collapse-1'));
    console.log(navbar.getInnerHtml());
    console.log("hello");
    expect(false);
  });
});
