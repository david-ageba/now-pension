@jenkins

Feature: Nowpensions Demo test
  Scenario: Initial demo test to check login email field
    Given I go to nowpensions.com homepage
    And I click on "Online sign up" button
    When I click on "Employers sign up here" tab
    Then a quick registration form with an email field and a password field should be displayed