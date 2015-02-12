@wip
Feature: Nowpensions Reset password

  Scenario: As a user I want to be able to Reset my password
    Given I go to nowpensions.com homepage
    And I click Login
    When I click "Reset your password" link
    And I complete my email address
    And I click on Reset password button
    Then this notice is displayed: "An email has been sent to you with instructions about how to reset your password."

  Scenario: Attempt to reset a non-existing user's password
    Given I go to nowpensions.com homepage
    And I click Login
    When I click "Reset your password" link
    And I fill in a non-existing email address
    And I click on Reset password button
    Then this notice is displayed: "Sorry, there was no registered user found with this email address."

  Scenario: Attempt to reset a password without completing an email address
    Given I go to nowpensions.com homepage
    And I click Login
    When I click "Reset your password" link
    And I click on Reset password button
    And I will not be redirected to the next page