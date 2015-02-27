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
  expect(@browser.text.include?("Help Centre for Employers")).to be true
end

Then(/^I will be redirected to the Help Centre for Employees/) do
  expect(@browser.text.include?("Help Centre for Employees")).to be true
end

Then(/^I will be redirected to the Help Centre for Payroll users$/) do
  expect(@browser.text.include?("Help Centre for Payroll bureaux")).to be true
end

Then(/^I will be redirected to the Journey page for Employers$/) do
  expect(@browser.text.include?("Thank you for your registration")).to be true
end

When(/^I enter a non\-existing username$/) do
  on(LoginPage).email_field = "#{Utility.get_random_string(5)}@#{Utility.get_random_string(5)}.com"
end

And(/^I enter a password$/) do
  on(LoginPage).password_field = Utility.get_random_string(8)
end

Then(/^I will see the error message: "([^"]*)"$/) do |message|
  expect(@browser.text.include? message).to be true
end

And(/^I will not be logged in$/) do
  expect(on(LoginPage).logoutLink?).to be false
end

But(/^I enter a bad password$/) do
  on(LoginPage).password_field = Utility.get_random_string(8)
end