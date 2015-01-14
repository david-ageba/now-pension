Given(/^I go to nowpensions\.com homepage$/) do
  visit(HomePage)
end

And(/^I click on "([^"]*)" button$/) do |arg|
  on(HomePage).signupLogo
end

When(/^I click on "([^"]*)" tab$/) do |arg|
  on(HomePage).empoyersSignup
end

Then(/^a quick registration form with an email field and a password field should be displayed$/) do
  expect(on(HomePage).email_field?).to be true
  expect(on(HomePage).password_field?).to be true
end