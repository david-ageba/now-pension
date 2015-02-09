@jenkins

Feature: Nowpensions Login functionality with different user roles.

  Scenario: Login with Adviser user role
    Given I go to nowpensions.com homepage
    And I click on Login link
    When I complete my "Adviser" user email and password
    And I click Login
    Then I will be redirected to the Help Centre for Advisers

  Scenario: Login with Employer user role
    Given I go to nowpensions.com homepage
    And I click on Login link
    When I complete my "Employer" user email and password
    And I click Login
    Then I will be redirected to the Journey page for Employers

  Scenario: Login with NPM user role
    Given I go to nowpensions.com homepage
    And I click on Login link
    When I complete my "NPM" user email and password
    And I click Login
    Then I will be redirected to the Help Centre for Employees

  Scenario: Login with Payroll user role
    Given I go to nowpensions.com homepage
    And I click on Login link
    When I complete my "Payroll" user email and password
    And I click Login
    Then I will be redirected to the Help Centre for Payroll users
