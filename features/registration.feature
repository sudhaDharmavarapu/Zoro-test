@Test
Feature: To test Registration process for Zoro Account

  Background:
    Given I am on the registration page

  Scenario: Check all necessary fields are present
    When I should see all the fields on the page
    Then I should see Create New Account button should not be active


  Scenario Outline: Create a New Account
    When I fill in <Field Name> Field with <input>

    Examples:

      | Field Name       | input             |
      | Title            | Mrs               |
      | First Name       | ABC               |
      | Last Name        | XYZ               |
      | Telephone Number | 0123456789        |
      | Company Name     | ABC company       |
      | Email            | ABC.XYZ@gmail.com |
      | Password         | asdfssfs1£        |
      | Confirm Password | asdfssfs1£        |

    And I click Create New Account button
    Then I should see "You are successfully logged in!" message

  Scenario: To check registeration works fine with duplicate data
    When I enter existing user details
    Then I should see "Email already exist" message

  Scenario: To check registration works fine with missed mandatory fields
    When I leave any mandatory fields empty
    Then I should see Create New Account button is inactive

  Scenario: To check Password contraints are taken care
    When I enter Password field with <passwordInput>
    Then I shoud see "Password needs to be at least 7 characters long" message

    Examples:
      | passwordInput |
      | 32321         |
      | 213das        |
      | 1             |

  Scenario: To check Password and Confirm Password matches
    Given I fill Password field with "21313sdfsa"
    When I fill Confirmed Password with "sdfgsda213"
    Then I should see "Your two passwords do not match, please correct" message

  Scenario: To check if Telephone number field takes correct input
    When I fill Telephone Number field with <phoneNumber>
    Then I should see "Please enter a valid UK phone number" message
    Examples:
      | phoneNumber          |
      | 1                    |
      | 123133               |
      | 12JHKHK              |
      | &*%^$^^              |
      | 231^^**              |
      | asda*^*              |
      | 32420482342342342342 |

  Scenario: To check if Email field takes correct input
    When I fill Email field with <email>
    Then I should see "Please enter a valid email address" message
    Examples:
      | email             |
      | ABC.XYZ@gmail.    |
      | ABC.XYZ@gmail     |
      | ABC.XYZgmail.com  |
      | ABC.XYZ&gmail.com |
      | 234723423         |
      | @&*&*@&           |
      | 3227@9324234.c    |