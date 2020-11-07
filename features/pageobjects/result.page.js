const Page = require('./page');

/**
 * sub page containing specific selectors and methods for a specific page
 */
class ResultPage extends Page {
    /**
     * define selectors using getter methods
     */
    get message () { return $('.ToastWrapper_ToastMessage div:nth-child(2)') }
    get errorMessage() { return $('.error .log-error[data-e2e="logErrorLoginForm"]') }
}

module.exports = new ResultPage();
