class LoginPage
  include PageObject
  include RSpec::Matchers
  include DataMagic

  page_url "#{EnvConfig["base_url"]}/login"

  link :loginLink, text: 'Login'
  text_field :email_field, id: 'osuemail'
  text_field :password_field, id: 'osupassword'
  button :loginButton, name: 'osu-widget'
  select :register_here, id: 'osu_login_signup'

  def input_user(user_role, data = {})
    case user_role
      when 'Employer'
        populate_page_with data_for(:employer_login_info, data)
      when 'NPM'
        populate_page_with data_for(:employee_login_info, data)
      when 'Adviser'
        populate_page_with data_for(:adviser_login_info, data)
      when 'Payroll'
        populate_page_with data_for(:payroll_login_info, data)
    end
  end

end