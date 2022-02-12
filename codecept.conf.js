exports.config = {
  tests: './tests/*_test.js',
  output: './output',
  helpers: {
    Puppeteer: {
      url: 'https://github.com/hideshis',
      show: false,
      windowSize: '1200x900',
      fullPageScreenshots: true,
      chrome: {
        args: ['--no-sandbox']
      }
    }
  },
  include: {
    I: './steps_file.js'
  },
  bootstrap: null,
  mocha: {},
  name: 'codeceptjs_sample2',
  translation: 'ja-JP',
  plugins: {
    allure: {}
  }
}
