Given(/^my email inbox is empty$/) do
  GoogleMail.delete_all_emails
end

And(/^the test user doesn't exist in the database$/) do
  visit(AdminPage).verify_and_delete_user EnvConfig["gmail_username"]
end

And(/^I click Register here$/) do
  on(LoginPage).show_hidden_select
end

When(/^I click Employer Registration$/) do
  on(LoginPage).select_registration "Employer registration"
end

And(/^I complete my Employer information$/) do
  on(RegistrationPage).complete_registration_info "Employer"
end

And(/^I click Register$/) do
  on(RegistrationPage).register
end

Then(/^I should receive an email with a confirmation link in it$/) do
  @link = (GoogleMail.get_last_mail_text_with_subject "Thanks for Registering with NOW: Pensions").split("underline;\" href=\"")[1].split("\" title=\"Start the Application\"")[0]
end

When(/^I access that link$/) do
  @browser.goto @link
end

Then(/^the first step of the journey is completed$/) do
  expect(on(RegistrationPage).step_one_completed?).to be true
end

And(/^I am asked to login$/) do
  expect(on(RegistrationPage).step_one_completed.include?("Login to your NOW: Pensions account"))
end

And(/^I fill in my email and password$/) do
  on(LoginPage).complete_login_info EnvConfig["registered_username"], EnvConfig["registered_password"]
end

Then(/^the second step of the journey is completed$/) do
  expect(on(RegistrationPage).step_two_completed?).to be true
end

When(/^I click Adviser Registration$/) do
  on(LoginPage).select_registration "Adviser registration"
end

And(/^I complete my Adviser information$/) do
  on(RegistrationPage).complete_registration_info "Adviser"
end

When(/^I click Payroll bureau registration$/) do
  on(LoginPage).select_registration "Payroll bureau registration"
end

When(/^I click Get started button$/) do
  on(RegistrationPage).get_started
end

And(/^I complete my Payroll information$/) do
  on(RegistrationPage).complete_registration_info "Payroll"
end

And(/^I click on Login$/) do
  on(RegistrationPage).login_button
end

And(/^I click on Register$/) do
  on(RegistrationPage).payroll_register_button
end

And(/^I confirm$/) do
  sleep 2
  on(RegistrationPage).confirm_yes
end