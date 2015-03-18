And(/^I am logged in with my "([^"]*)" account$/) do |account_type|
  on(HomePage).loginLink
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
  on(ApplicationPage).complete_adviser_application
end

Then(/^I will see a Draft of the participation agreement$/) do
  expect(@browser.text.include? "Please take a look at the draft agreement below.").to be true
end

And(/^I can download the agreement, or I can see my plan summary, or I can Continue$/) do
  expect(on(ApplicationPage).see_plan_summary?).to be true
  expect(on(ApplicationPage).download_draft_agreement?).to be true
  expect(on(ApplicationPage).continue?).to be true
end

Then(/^a "Share this page" modal is displayed$/) do
  sleep 1
  expect(on(ApplicationPage).share_this_page_element.visible?).to be true
end

And(/^I click on Send$/) do
  on(ApplicationPage).send_button
end

And(/^my contact should receive an email with a link$/) do
  @link = (GoogleMail.get_last_mail_text_with_subject "Please authorise the NOW: Pensions Application Form for Employer").split("underline;\" href=\"")[1].split("\">http")[0]
  puts @link
end

And(/^I go to that link$/) do
  @browser.goto @link
end

And(/^I complete the required info in the modal$/) do
  on(ApplicationPage).modal_confirmation
end

When(/^I click on Delete link$/) do
  on(ApplicationPage).delete_link
  @browser.alert.ok
end

Then(/^the following message is displayed: "([^"]*)"$/) do |message|
  expect(@browser.text.include? message).to be true
end

Given(/^I don't have any application registered for my account$/) do
  @browser.cookies.clear
  visit(AdminPage).delete_employer_applications EnvConfig["employer_username"]
end

When(/^I click Start application$/) do
  on(ApplicationPage).start_employer_application
end

When(/^I click on Continue application$/) do
  on(ApplicationPage).continue_application
end

And(/^I complete the required Employer information$/) do
  on(ApplicationPage).complete_employer_application
end

And(/^I complete the required PAYE information$/) do
  on(ApplicationPage).complete_paye_info
end

And(/^the third step of the journey is completed$/) do
  expect(on(RegistrationPage).step_three_completed?).to be true
end

And(/^I click on Continue button of the welcome page$/) do
  on(ApplicationPage).continue_link
end

And(/^I delete all my applications$/) do
unless @browser.text.include?("You don't have any active applications.")
    while on(ApplicationPage).delete_link?
      on(ApplicationPage).delete_link
      @browser.alert.ok
      break if @browser.text.include?("You don't have any active applications.")
    end
  end
end

Then(/^I will see my previously started application$/) do
  expect(on(ApplicationPage).active_applications_table?).to be true
end