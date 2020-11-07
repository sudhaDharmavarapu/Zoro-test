Feature: To test Login functionality for Zoro website

  Background:
    Given I am on the login page

  @login
  Scenario Outline: Verification of login functionality
    When I login with <emailId> and <password>
    Then I should see a message saying <message>
    Examples:
      | emailId              | password | message                         |
      #Valid login details
      | test150420@gmail.com | 9999999  | You are successfully logged in! |

  @login
  Scenario Outline: Unsuccessful login functionality
    When I login with <emailId> and <password>
    Then It should show this error message: <message>

    Examples:
      | emailId              | password | message                                     |
      #Invalid password
      | test150420@gmail.com | 9999     | Invalid email or password please try again. |
      #Invalid email id
      | test150420@gmail.co  | 9999999  | Invalid email address or password           |
      #Invalid email id and password
      | test150420@gmail.co  | 99999    | Invalid email address or password           |

  @forgot-password
  Scenario Outline: Forgot password

    Given I forgot my password for <emailId>
    When I click on 'forgot passord' button
    And Click on 'submit' button
    Then I should get expected response as <message>
     Examples:
      | emailId                      | message                                                   |
      #| test150420@gmail.com | Thank you. We have sent you an email with steps to follow|
      | sudha.dharmavarapu@yahoo.com | Thank you. We have sent you an email with steps to follow |