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
#  on(RegistrationPage).register
end

Then(/^I should receive an email with a confirmation link in it$/) do
  pending
end

When(/^I access that link$/) do
  pending
end

Then(/^the first step of the journey is completed$/) do
  pending
end

And(/^I am asked to login$/) do
  pending
end

And(/^I fill in my email and password$/) do
  pending
end

Then(/^the second step of the journey is completed$/) do
  pending
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