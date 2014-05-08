exports.config = {
  capabilities: {
    'browserName': 'phantomjs'
  },
  seleniumAddress: 'http://'
  					+ process.env['WEBDRIVER_PORT_4444_TCP_ADDR']
  					+ ':'
  					+ process.env['WEBDRIVER_PORT_4444_TCP_PORT']
  					+ '/wd/hub',
  specs: ['test/hello.js']
    //http://eitanp461.blogspot.com.au/2014/01/advanced-protractor-features.html
    //'loggingPrefs': {
    //        'browser': 'ALL'
    //            }
}
