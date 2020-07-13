var webdriverio = require('webdriverio');
var options = { desiredCapabilities: { browserName: 'chrome' } };
const { Given, When, Then, setDefaultTimeout } = require('cucumber');
const expect = require('chai').expect;
const wdioConfig = require('../../wdio.conf').config;
const _ = require('lodash')
setDefaultTimeout(60 * 1000);

var botMsgsList = [];


Given('I navigate to Miply Home Page URL', function () {
    browser.url(wdioConfig.baseUrl)

    browser.waitUntil(() => {
        return browser.isVisible('#bot-messages')
    })
});

Then('I read messages from Miply', function() {
    browser.pause(6000);

    let botMsgs = browser.$$('#bot-messages li.message')    
    botMsgs.forEach(elem => {
        let msg = browser.elementIdText(elem.value.ELEMENT)
        botMsgsList.push(msg.value.toString())
    })
});
    
Then('Miply says {string}', function (string) {
    browser.pause(2000);

    var eles = browser.$$('#bot-messages-container > ul p');
    eles.forEach(elem1 => {
        let msg = browser.elementIdText(elem1.value.ELEMENT)
        if (msg.value.toString() == string) {
            console.log('found miply message');
            console.log(msg.value.toString())
        }
    })

    let botMsgs3 = browser.$$('#bot-messages-container > ul p')
    botMsgs3.forEach(elem => {
        let msg = browser.elementIdText(elem.value.ELEMENT)
        botMsgsList.push(msg.value.toString())
    })

    var f =  _.some(botMsgsList, _.unary(_.partialRight(_.includes, string)));
    expect(f).to.be.true;
});

Then('Anonymous Prospect responds {string}', function (string) {
    browser.waitForVisible(`//button[contains(text(),\"${string}\")]`);

    browser.waitUntil(() => {
        return browser.isVisible(`//button[contains(text(),\"${string}\")]`)
    })

    browser.click(`//button[contains(text(),\"${string}\")]`);
});

Then('Anonymous Prospect completes full name request via done button', function (dataTable) {
    browser.waitUntil(() => {
        return browser.isVisible('#input-table-0-1')
    })

    browser.selectByValue('#input-table-0-1', dataTable.rowsHash()['title']);
    browser.setValue('#input-table-1-1', dataTable.rowsHash()['firstname'])
    browser.setValue('#input-table-2-1', dataTable.rowsHash()['lastname'])

    browser.waitUntil(() => {
        return browser.isVisible('#bot-interface > div.input-table-wrapper > div > div > div.input-table__submit > button')
    })

    browser.click('#bot-interface > div.input-table-wrapper > div > div > div.input-table__submit > button')
});

Then('Anonymous Prospect completes full name request', function (dataTable) {
    browser.waitUntil(() => {
        return browser.isVisible('#input-table-0-1')
    })

    browser.selectByValue('#input-table-0-1', dataTable.rowsHash()['title']);
    browser.setValue('#input-table-1-1', dataTable.rowsHash()['firstname'])
    browser.setValue('#input-table-2-1', dataTable.rowsHash()['lastname'])

    browser.waitUntil(() => {
        return browser.isVisible('#bot-interface > form > div > div.bot-interface-input-bar > div.bot-interface-interactions > button.bot-interface__send-btn.bot-interface-btn')
    })

    browser.click('#bot-interface > form > div > div.bot-interface-input-bar > div.bot-interface-interactions > button.bot-interface__send-btn.bot-interface-btn')
});


Then('Anonymous Prospect completes Eligibility Question in BOT', function (dataTable) {
    dataTable.rows().forEach(r => {
        browser.waitUntil(() => {
            return browser.isVisible(`//button[contains(text(),\"${r[1]}\")]`)
        })

        let botMsgs = browser.$$('#bot-messages li.message')
        botMsgs.forEach(elem => {
            let msg = browser.elementIdText(elem.value.ELEMENT)
            botMsgsList.push(msg.value.toString())
        })

        var f =  _.some(botMsgsList, _.unary(_.partialRight(_.includes, r[0])));
        expect(f).to.be.true;

        browser.click(`//button[contains(text(),\"${r[1]}\")]`)
    })
});