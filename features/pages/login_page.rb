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
  text_field :first_name, name: 'osu_user[first_name]'
  link :logoutLink, text: 'Logout'


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

  def complete_login_info(username, password)
    self.email_field = username
    self.password_field = password
  end

  def login_with(username, password)
    self.email_field = username
    self.password_field = password
    loginButton
  end

  def show_hidden_select
    script = "return arguments[0].style = 'display:true'"
    hidden_select = browser.select(id: 'osu_login_signup')
    browser.execute_script(script, hidden_select)
  end

  def select_registration(user_role)
    case user_role
      when 'Employer registration'
        browser.goto "#{EnvConfig["base_url"]}/employers/register"
      when 'Adviser registration'
        browser.goto "#{EnvConfig["base_url"]}/adviser/register"
      when 'Payroll bureau registration'
        browser.goto "#{EnvConfig["base_url"]}/payroll"
    end
  end

end