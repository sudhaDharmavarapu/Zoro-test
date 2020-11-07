const Page = require('./page');

/**
 * sub page containing specific selectors and methods for a specific page
 */
class ForgotPasswordPage extends Page {
    /**
     * define selectors using getter methods
     */
    get header() {return $('.col-md-12 h1')}
    get btnSubmit() {return $('.forgotPasswordForm-submitButton')}
    get message() {return $('.ForgotPasswordMailConfirmationScreen-message h2')}
    /**
     * a method to encapsule automation code to interact with the page
     * e.g. to click submit button
     */

    clickSubmit() {
      this.btnSubmit.click();
    }
}

module.exports = new ForgotPasswordPage();