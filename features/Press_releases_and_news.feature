Feature: Nowpensions Press and News
  Background:
    Given I go to nowpensions.com homepage

  # Press releases related test cases
  Scenario: As a guest user I want to be able to see a list of the Nowpensions press releases
    When I click on the Press link
    Then I will see a list of press releases
    And some Press Contact information
    And a "View all press releases" button

  Scenario: As a guest user I want to be able to read one of the Nowpensions press releases
    And I click on the Press link
    And I will see a list of press releases
    When I click on the first press release
    Then I will see the press release's publishing date
    And a "Print this page" button
    And a "Copy this page link" button
    And a "Share" button
    And a "Download press release" button

  Scenario: As a guest user I want to be able to Print a Nowpensions press release
    And I click on the Press link
    And I will see a list of press releases
    And I click on the first press release
    When I click on the "Print this page" link
    Then a print page popup shows up

  Scenario: As a guest user I want to be able to copy a Nowpensions press release's link via the Copy this page link
    And I click on the Press link
    And I will see a list of press releases
    And I click on the first press release
    When I click on the "Copy this page link" button
    Then the clipboard should contain the link of the press release

  # News related test scenarios
  Scenario: As a guest user I want to be able to see a list of the Nowpensions News
    And I click on the Press link
    When I click on the News link
    Then I will see a list of News
    And some Press Contact information

  Scenario: As a guest user I want to be able to read one of the Nowpensions News
    And I click on the Press link
    And I click on the News link
    And I will see a list of News
    When I click on the first News article
    Then I will see the News' publishing date
    And a "Print this page" button
    And a "Copy this page link" button
    And a "Share" button
    And a "View all news" button

  Scenario: As a guest user I want to be able to Print one of the Nowpensions News
    And I click on the Press link
    And I click on the News link
    And I will see a list of News
    And I click on the first News article
    When I click on the "Print this page" link
    Then a print page popup shows up

  Scenario: As a guest user I want to be able to Copy one of the Nowpensions News
    And I click on the Press link
    And I click on the News link
    And I will see a list of News
    And I click on the first News article
    When I click on the "Copy this page link" button
    Then the clipboard should contain the link of the press release

  # Same test scenarios with logged in user
  Scenario: As a logged in user I want to be able to see a list of the Nowpensions press releases
    And I click on Login link
    And I complete my "Adviser" user email and password
    And I click Login
    And I go to nowpensions.com homepage
    When I click on the Press link
    Then I will see a list of press releases
    And some Press Contact information
    And a "View all press releases" button
    Then I click Logout

  Scenario: As a logged in user I want to be able to read one of the Nowpensions press releases
    And I click on Login link
    And I complete my "Adviser" user email and password
    And I click Login
    And I go to nowpensions.com homepage
    And I click on the Press link
    And I will see a list of press releases
    When I click on the first press release
    Then I will see the press release's publishing date
    And a "Print this page" button
    And a "Copy this page link" button
    And a "Share" button
    And a "Download press release" button
    Then I click Logout

  Scenario: As a logged in user I want to be able to Print a Nowpensions press release
    And I click on Login link
    And I complete my "Adviser" user email and password
    And I click Login
    And I go to nowpensions.com homepage
    And I click on the Press link
    And I will see a list of press releases
    And I click on the first press release
    When I click on the "Print this page" link
    Then a print page popup shows up
    Then I click Logout

  Scenario: As a logged in user I want to be able to copy a Nowpensions press release's link via the Copy this page link
    And I click on Login link
    And I complete my "Adviser" user email and password
    And I click Login
    And I go to nowpensions.com homepage
    And I click on the Press link
    And I will see a list of press releases
    And I click on the first press release
    When I click on the "Copy this page link" button
    Then the clipboard should contain the link of the press release
    Then I click Logout

  Scenario: As a logged in user I want to be able to see a list of the Nowpensions News
    And I click on Login link
    And I complete my "Adviser" user email and password
    And I click Login
    And I go to nowpensions.com homepage
    And I click on the Press link
    When I click on the News link
    Then I will see a list of News
    And some Press Contact information
    Then I click Logout

  Scenario: As a logged in user I want to be able to read one of the Nowpensions News
    And I click on Login link
    And I complete my "Adviser" user email and password
    And I click Login
    And I go to nowpensions.com homepage
    And I click on the Press link
    And I click on the News link
    And I will see a list of News
    When I click on the first News article
    Then I will see the News' publishing date
    And a "Print this page" button
    And a "Copy this page link" button
    And a "Share" button
    And a "View all news" button
    Then I click Logout

  Scenario: As a logged in user I want to be able to Print one of the Nowpensions News
    And I click on Login link
    And I complete my "Adviser" user email and password
    And I click Login
    And I go to nowpensions.com homepage
    And I click on the Press link
    And I click on the News link
    And I will see a list of News
    And I click on the first News article
    When I click on the "Print this page" link
    Then a print page popup shows up
    Then I click Logout

  Scenario: As a logged in user I want to be able to Copy one of the Nowpensions News
    And I click on Login link
    And I complete my "Adviser" user email and password
    And I click Login
    And I go to nowpensions.com homepage
    And I click on the Press link
    And I click on the News link
    And I will see a list of News
    And I click on the first News article
    When I click on the "Copy this page link" button
    Then the clipboard should contain the link of the press release
    Then I click Logout