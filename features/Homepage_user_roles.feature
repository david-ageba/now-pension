Feature: Nowpensions homepage user role set by cookie.

  Scenario: Employer role set by cookie
    Given I go to nowpensions.com homepage
    When I click on Employer button
    Then I should see the Employer landing page
    And a cookie with Employer user role should be set in my browser
    When I click on the Help Centre link
    Then I will be redirected to the Help Centre for Employer

  Scenario: Employee role set by cookie
    Given I go to nowpensions.com homepage
    When I click on Employee button
    Then I should see the Employee landing page
    When I click on the Help Centre circle
    Then I will be redirected to the Help Centre for Employees
    And a cookie with Employee user role should be set in my browser

  Scenario: Adviser role set by cookie
    Given I go to nowpensions.com homepage
    When I click on Adviser button
    Then I should see the Advisers landing page
    And a cookie with Adviser user role should be set in my browser
    When I click on the Help Centre link
    Then I will be redirected to the Help Centre for Advisers

  Scenario: Payroll Bureau role set by cookie
    Given I go to nowpensions.com homepage
    When I click on Payroll Bureau button
    Then I should see the Payroll Bureau landing page
    And a cookie with Payroll Bureau user role should be set in my browser
    When I click on the Help Centre link
    Then I will be redirected to the Help Centre for Payroll users
