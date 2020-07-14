const defineSupportCode = require('cucumber').defineSupportCode;
const { Given, When, Then, setDefaultTimeout } = require('cucumber');
const expect = require('chai').expect;
const locators = require('../locators/locators');
const data = require('../data/data');
const input = $('.input');


Given(/^I open the url "([^"]+)"$/, function(urlToBeOpened){
    browser.url(urlToBeOpened);
    browser.waitUntil(function() {
        const readyState = browser.execute(function() {
            return document.readyState;
        });
        return readyState.value === 'complete';
    }, 60000, "Unforeseen error while loading the URL", 3000);
});


When(/^I expect "([^"]+)" to be visible$/, function(element){
    // browser.waitForDisplayed(locators[element]);
});

When(/^It should be "([^"]+)" displayed$/, function(element){
    // browser.waitForDisplayed(locators[element]);
});


Then(/^I expect "([^"]+)" to be "([^"]+)"$/, function(element,dataSelector){
    // browser.waitForDisplayed(locators[element]);
    let actualHeaderText = browser.getText(locators[element]);
    expect(actualHeaderText).to.be.equal(data[dataSelector], "Expected text is not present");
});

When(/^I fill "([^"]+)" with "([^"]+)"$/, function(element,data){
    // browser.waitForDisplayed(locators[element]);
    if(locators[element].includes('select')){
        browser.selectByValue(locators[element], data);
    } else {
        input.addValue(locators[element], data);
    }
})
When(/^I enter "([^"]+)" with "([^"]+)"$/, function(element,data){
    // browser.waitForDisplayed(locators[element]);
    if(locators[element].includes('select')){
        browser.selectByValue(locators[element], data);
    } else {
        input.addValue(locators[element], data);
    }
})

When(/^I select "([^"]+)"$/, function(element){
    // browser.waitForDisplayed(locators[element]);
    browser.pause(2000);
    browser.elementClick(locators[element]);
});

When(/^I pause for sometime$/, function(){

    browser.pause(10000);

});
Given('I loginto HBC', function () {
    console.log(`I login`);
    browser.click("//a[@class='login']");
    browser.pause(10000);
    browser.waitForDisplayed("//input[@id='email']");
    browser.setValue("//input[@name='email']", "ujungoka@hotmail.com");
    browser.waitForDisplayed("//p[@class='submit']//span[1]");
    browser.setValue("//input[@id='passwd']", "obianuju");
  });

  function clickElement(xpath) {
    console.log(`I click element "${xpath}"`);
    browser.pause(10000);
    // browser.pause(browserPause);
    // highlight(xpath);
    try {
      browser.click(xpath);
    } catch (err) {
      throw new Exception(err);
    }
  }
