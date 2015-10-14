When(/^I click on ([^"]*) button$/) do |button_name|
  case button_name
    when "Employer"
      on(HomePage).employer_button
    when "Employee"
      on(HomePage).employee_button
    when "Adviser"
      on(HomePage).adviser_button
    when "Payroll Bureau"
      on(HomePage).payroll_bureau_button
  end
end

Then(/^I should see the ([^"]*) landing page$/) do |landing_page|
  @browser.wait(5)
  case landing_page
    when "Employer"
      expect(@browser.text.include?("All employers and employees are welcome")).to be true
    when "Employee"
      expect(on(HomePage).homepage_heading.include?("What would you like to do?")).to be true
    when "Adviser"
      expect(@browser.text.include?("Get access to our adviser toolkit")).to be true
    when "Payroll Bureau"
      expect(@browser.text.include?("Simple processes for application and administration")).to be true
  end
end

And(/^a cookie with ([^"]*) user role should be set in my browser$/) do |user_role|
  case user_role
    when "Employer"
      expect(@browser.cookies[:osu_user_role][:value] == 'company').to be true
    when "Employee"
      expect(@browser.cookies[:osu_user_role][:value] == 'employee').to be true
    when "Adviser"
      expect(@browser.cookies[:osu_user_role][:value] == 'ifa').to be true
    when "Payroll Bureau"
      expect(@browser.cookies[:osu_user_role][:value] == 'payroll').to be true
  end
end

When(/^I click on the Help Centre circle$/) do
  on(HomePage).help_centre_button
end