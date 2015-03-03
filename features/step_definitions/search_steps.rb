And(/^I click on the magnifier icon$/) do
  on(HomePage).magnifier
  sleep 1
end

When(/^I type "([^"]*)" into the search field$/) do |text|
  on(HomePage).search_top_right = text
end

And(/^I press Enter$/) do
  @browser.send_keys :return
end

Then(/^I should see a page with search results$/) do
  expect(@browser.text.include?("Search results for:")).to be true
end

And(/^I click on the Help Centre link$/) do
  on(HomePage).help_centre
end

When(/^I type "([^"]*)" into the search field on the top of the page$/) do |text|
  on(HelpCentrePage).bottom_search = text
end

Then(/^a list of search results is instantly displayed without pressing Enter$/) do
  sleep 2
  expect(on(HelpCentrePage).search_results.length == 0).to be false
end

And(/^the list of search results contains the term "([^"]*)"$/) do |text|
  expect(on(HelpCentrePage).search_results.include?(text)).to be true
end

And(/^I click on Employers link$/) do
  on(HomePage).employers
end