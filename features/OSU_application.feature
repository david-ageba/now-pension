Feature: Nowpensions OSU User application

  Scenario: Start new application as an Adviser
    Given I go to nowpensions.com homepage
    And I am logged in with my "Adviser" account
    When I click Start a new application
    And I click on Continue button of the welcome page
    Then I am at the first step of my application
    And I choose No
    Then I can save my application, or Continue
    When I click Save
    Then the following message is diaplayed: "Form saved"
    And I click Logout

  Scenario: Continue an uncompleted application as an Adviser
    Given I go to nowpensions.com homepage
    And I am logged in with my "Adviser" account
    When I click Manage applications
    Then I will see my previously started application with status: "Bureau"
    When I click on the Continue link
    Then I will see my previously saved progress
    And I click on Continue
    And I choose Plan 101
    And I complete all the mandatory info
    When I click on Continue
    Then I will see a Draft of the participation agreement
    And I can download the agreement, or I can see my plan summary, or I can Continue
    When I click on Continue
    Then a "Share this page" modal is displayed
    And I click on Send
    And my contact should receive an email with a link
    And I go to that link
    When I click on Continue
    And I complete the required info in the modal
    And I click Logout

  Scenario: Delete application as an Adviser
    Given I go to nowpensions.com homepage
    And I am logged in with my "Adviser" account
    When I click Manage applications
    Then I will see my previously started application with status: "Application submitted online"
    When I click on Delete link
    And I confirm my action
    Then the following message is displayed: "Application deleted"

  @wip
  Scenario: Start application as an Employer
    Given I don't have any application registered for my account
    And I go to nowpensions.com homepage
    And I am logged in with my "Employer" account
    When I click Start application
    And I choose No
    Then I can save my application, or Continue
    When I click Save
    Then the following message is diaplayed: "Form saved"
    And I click Logout

  @wip
  Scenario: Continue an uncompleted application as an Employer
    Given I go to nowpensions.com homepage
    And I am logged in with my "Employer" account
    When I click on Continue application
    Then I will see my previously saved progress
    And I click on Continue
    And I choose Plan 101
    And I click on Continue
    And I complete the required Employer information
    And I click on Continue
    And I complete the required PAYE information
    When I click on Continue
    Then I will see a Draft of the participation agreement
    And I can download the agreement, or I can see my plan summary, or I can Continue
    When I click on Continue
    And I complete the required info in the modal
    Then I will be redirected to the Journey page for Employers
    And the third step of the journey is completed
    Then I click Logout