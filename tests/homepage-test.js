const assert = require('assert');

describe("Test webdriveruni homepage", () => {
  it("Validate whether the webdriver uni homepage title is correct", () => {
      browser.url('./')
      const title = browser.getTitle()
      assert.strictEqual(title, 'Lace Wigs, Hair Weave, Hair Extension - Hair and Beauty Centre - Hair and Beauty Centre')
  });
});
