Given(/^I go to nowpensions\.com homepage$/) do
  visit(HomePage)
end

And(/^I click on Login link$/) do
  on(HomePage).loginLink
end

When(/^I complete my "([^"]*)" user email and password$/) do |user_role|
  on(LoginPage).input_user(user_role)
end

And(/^I click Login$/) do
  on(LoginPage).loginButton
end

Then(/^I will be redirected to the Help Centre for Advisers$/) do
  expect(@browser.text.include?("Help Centre for Advisers")).to be true
end

Then(/^I will be redirected to the Help Centre for Employers$/) do
  expect(@browser.text.include?("Employer Help Centre")).to be true
end

Then(/^I will be redirected to the Help Centre for Employees$/) do
  expect(@browser.text.include?("Help Centre")).to be true
end

Then(/^I will be redirected to the Help Centre for Payroll users$/) do
  expect(@browser.text.include?("Bureau Help Centre")).to be true
end