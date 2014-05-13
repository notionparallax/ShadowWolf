exports.config = {
  capabilities: {
    'browserName': 'phantomjs'
  },
  seleniumAddress: 'http://'
  					+ process.env['WEBDRIVER_PORT_4444_TCP_ADDR']
  					+ ':'
  					+ process.env['WEBDRIVER_PORT_4444_TCP_PORT']
  					+ '/wd/hub',
  //  specs: ['test/hello.js']
  suites: {
    all: 'test/**/*.js',
    index: 'test/e2e/index.js',
    show: 'test/e2e/show.js',
    editables: 'test/e2e/editables.js'
  }
    //http://eitanp461.blogspot.com.au/2014/01/advanced-protractor-features.html
    //'loggingPrefs': {
    //        'browser': 'ALL'
    //            }
}
