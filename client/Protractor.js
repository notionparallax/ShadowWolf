exports.config = {
  capabilities: {
    'browserName': 'phantomjs'
  },
  seleniumAddress: 'http://172.17.0.6:4444/wd/hub',
  specs: ['test/hello.js']
}
