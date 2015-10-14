class AdminPage
  include PageObject
  include RSpec::Matchers

  page_url "#{EnvConfig["base_url"]}/wp-admin"

  text_field :username, id: 'user_login'
  text_field :password, id: 'user_pass'
  button :login_button, id: 'wp-submit'
  text_field :users_search, css: 'div#osu-users_filter label input'
  text_field :osu_applications_search, css: 'div#applications_filter label input'
  button :delete_user, value: 'Delete'
  button :delete_application, text: 'Delete application'
  table :osu_users, id: 'osu-users'
  table :osu_applications, id: 'applications'
  link :open_application, title: 'Click to view application details'

  def login
    self.username = EnvConfig["admin_username"]
    self.password = EnvConfig["admin_password"]
    login_button
    sleep 3
  end

  def verify_and_delete_user(username)
    login
    browser.goto "#{EnvConfig["base_url"]}/wp-admin/admin.php?page=osu_users"
    self.users_search = username
    delete_user unless self.osu_users_element.text.include?('No matching records found')
    browser.cookies.clear
  end

  def delete_employer_applications(username)
    login
    browser.goto "#{EnvConfig["base_url"]}/wp-admin/admin.php?page=osu_applications"
    self.osu_applications_search = username
    sleep 1
    unless osu_applications_element.text.include?('No matching applications')
      open_application
      delete_application
    end
    browser.cookies.clear
  end
end