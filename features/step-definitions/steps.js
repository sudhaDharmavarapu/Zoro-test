const { Given, When, Then } = require('cucumber');

const LoginPage = require('../pageobjects/login.page');
const ResultPage = require('../pageobjects/result.page');
const ForgotPasswordPage = require('../pageobjects/forgot-password');
const { expect } = require('chai');
//const cucumberJson = require('../../utils/cucumber-json-report');

const pages = {
    login: LoginPage
}

Given(/^I am on the (\w+) page$/, (page) => {
    pages[page].open()
});

Given(/^I forgot my password for (.*?)$/, (email)=>{
    LoginPage.inputEmail.setValue(email);
});

When(/^I click on 'forgot passord' button$/,() =>{
    LoginPage.forgotPassword();
});


When(/^I login with (.*?) and (.*?)$/, (email, password) => {

    LoginPage.login(email, password)
});

When(/^Click on 'submit' button$/,() => {
    expect(ForgotPasswordPage.header.getText()).contains('Reset Password')
    ForgotPasswordPage.clickSubmit();
});


Then(/^I should see a message saying (.*)$/, (message) => {
    ResultPage.message.waitForDisplayed({timeout:3000})
       expect(ResultPage.message.getText()).contains(message);
   
});

Then(/^It should show this error message: (.*)$/, (message) => {
    ResultPage.errorMessage.waitForDisplayed({timeout:3000})
     expect(ResultPage.errorMessage.getText()).contains(message);

});

Then(/^I should get expected response as (.*)$/,(message)=>{
     expect(ForgotPasswordPage.message.getText()).contains(message);
});

