When(/^I click "Reset your password" link$/) do
  @browser.link(text: 'Reset your password').click
end

And(/^I complete my email address$/) do
  on(ResetPasswordPage).reset_pass_email = "beniamin.kis@experiencematter.co.uk"
end

Then(/^this notice is displayed: "([^"]*)"$/) do |text|
  expect(on(ResetPasswordPage).login_form.include? text).to be true
end

And(/^I fill in a non\-existing email address$/) do
  on(ResetPasswordPage).setRandomEmail
end

And(/^I will not be redirected to the next page$/) do
  expect(on(ResetPasswordPage).reset_pass_email?).to be true
end

And(/^I click on "Reset password" button$/) do
  on(ResetPasswordPage).reset_pass_button
end