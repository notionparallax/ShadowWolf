exports.config = {
  capabilities: {
    'browserName': 'chrome',
    'phantomjs.binary.path': '../phantomjs/bin/phantomjs',
    'chromeOptions': {
    }
  },
  seleniumAddress: 'http://'
            + process.env['WEBDRIVER_PORT_4444_TCP_ADDR']
            + ':'
            + process.env['WEBDRIVER_PORT_4444_TCP_PORT']
            + '/wd/hub',
  specs: ['test/features/*.feature'],
  suites: {
    all: 'test/features/*.feature'
  //  index: 'test/e2e/index.js',
  //  show: 'test/e2e/show.js',
  //  editables: 'test/e2e/editables.js',
  //  projects: 'test/e2e/projects.js',
  //  general: 'test/e2e/general.js'
  },
  framework: 'cucumber',
  cucumberOpts: {
    require: 'test/features/step_definitions/hello_world.js',
    format: 'pretty'
  }
  //http://eitanp461.blogspot.com.au/2014/01/advanced-protractor-features.html
  //'loggingPrefs': {
  //  'browser': 'ALL'
  //}
}
