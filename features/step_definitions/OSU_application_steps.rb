And(/^I am logged in with my "([^"]*)" account$/) do |account_type|
  case account_type
    when 'Adviser'
      on(LoginPage).login_with EnvConfig["adviser_username"], EnvConfig["adviser_password"]
    when 'Employer'
      on(LoginPage).login_with EnvConfig["employer_username"], EnvConfig["employer_password"]
  end
end

When(/^I click Start a new application$/) do
  on(ApplicationPage).start_new_application
end

Then(/^I am at the first step of my application$/) do
  expect(on(ApplicationPage).first_step_active?).to be true
end

And(/^I choose No$/) do
  on(ApplicationPage).select_step1_no
end

Then(/^I can save my application, or Continue$/) do
  expect(on(ApplicationPage).save?).to be true
  expect(on(ApplicationPage).continue?).to be true
end

When(/^I click Save$/) do
  on(ApplicationPage).save
end

Then(/^the following message is diaplayed: "([^"]*)"$/) do |message|
  expect(@browser.text.include? message).to be true
end

When(/^I click Manage applications$/) do
  on(ApplicationPage).manage_applications
end

Then(/^I will see my previously started application with status: "([^"]*)"$/) do |status|
  expect(on(ApplicationPage).active_applications_table_element.text.include? status).to be true
end

When(/^I click on the Continue link$/) do
  on(ApplicationPage).continue_link
end

Then(/^I will see my previously saved progress$/) do
  expect(on(ApplicationPage).first_step_active?).to be true
  expect(on(ApplicationPage).step1_no_selected?).to be true
end

And(/^I click on Continue$/) do
  on(ApplicationPage).continue
end

And(/^I choose Plan 101$/) do
  on(ApplicationPage).choose_101_plan
end

And(/^I complete all the mandatory info$/) do
  pending
end

Then(/^I will see a Draft of the participation agreement$/) do
  pending
end

And(/^I can download the agreement, or I can see my plan summary, or I can Continue$/) do
  pending
end

Then(/^a "([^"]*)" modal is displayed$/) do |arg|
  pending
end

And(/^I click on Send$/) do
  pending
end

And(/^my contact should receive an email with a link$/) do
  pending
end

And(/^I go to that link$/) do
  pending
end

And(/^I complete the required info in the modal$/) do
  pending
end

When(/^I click on Delete link$/) do
  pending
end

And(/^I confirm my action$/) do
  pending
end

Then(/^the following message is displayed: "([^"]*)"$/) do |arg|
  pending
end

Given(/^I don't have any application registered for my account$/) do
  pending
end

When(/^I click Start application$/) do
  pending
end

When(/^I click on Continue application$/) do
  pending
end

And(/^I complete the required Employer information$/) do
  pending
end

And(/^I complete the required PAYE information$/) do
  pending
end

And(/^the third step of the journey is completed$/) do
  pending
end