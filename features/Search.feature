@jenkins

Feature: Nowpensions Search functionality.

  Scenario: Global search from the homepage
    Given I go to nowpensions.com homepage
    And I click on the magnifier icon
    When I type "employer" into the search field
    And I press Enter
    Then I should see a page with search results

  Scenario: Help centre instant search
    Given I go to nowpensions.com homepage
    And I click on the Help Centre link
    When I type "employer" into the search field on the bottom of the page
    Then a list of search results is instantly displayed without pressing Enter

  Scenario: Help centre synonym search
    Given I go to nowpensions.com homepage
    And I click on the Help Centre link
    When I type "boss" into the search field on the bottom of the page
    Then a list of search results is instantly displayed without pressing Enter
    And the list of search results contains the term "employer"

  Scenario: Help centre search - glossary terms
    Given I go to nowpensions.com homepage
    And I click on the Help Centre link
    When I type "duties" into the search field on the bottom of the page
    Then a list of search results is instantly displayed without pressing Enter
    And the list of search results contains the term "(Glossary)"