#@wip
Feature: Nowpensions User registration

  Background: Get to the registration page
    Given my email inbox is empty
    And the test user doesn't exist in the database
    And I go to nowpensions.com homepage
    And I click on Login link
    And I click Register here

  Scenario: Employer registration flow
    When I click Employer Registration
    And I complete my Employer information
    And I click Register
    Then I should receive an email with a confirmation link in it
    When I access that link
    Then the first step of the journey is completed
    And I am asked to login
    And I click on Login
    And I fill in my email and password
    When I click Login
    Then the second step of the journey is completed

  Scenario: Adviser registration flow
    When I click Adviser Registration
    And I complete my Adviser information
    And I click Register
    Then I should receive an email with a confirmation link in it
    When I access that link
    Then the first step of the journey is completed
    And I am asked to login
    And I click on Login
    And I fill in my email and password
    When I click Login
    Then I will be redirected to the Help Centre for Advisers

  Scenario: Payroll Bureaux registration flow
    When I click Payroll bureau registration
    Then I should see the Payroll Bureau landing page
    When I click Get started button
    And I complete my Payroll information
    And I click Register
    Then I should receive an email with a confirmation link in it
    When I access that link
    Then the first step of the journey is completed
    And I am asked to login
    And I click on Login
    And I fill in my email and password
    When I click Login
    Then I will be redirected to the Help Centre for Payroll users