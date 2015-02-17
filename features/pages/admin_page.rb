class AdminPage
  include PageObject
  include RSpec::Matchers

  page_url "#{EnvConfig["base_url"]}/wp-admin"

  text_field :username, id: 'user_login'
  text_field :password, id: 'user_pass'
  button :login_button, id: 'wp-submit'
  text_field :users_search, css: 'div#osu-users_filter label input'
  button :delete_user, value: 'Delete'
  table :osu_users, id: 'osu-users'

  def login
    self.username = EnvConfig["admin_username"]
    self.password = EnvConfig["admin_password"]
    login_button
  end

  def verify_and_delete_user(username)
    login
    browser.goto "#{EnvConfig["base_url"]}/wp-admin/admin.php?page=osu_users"
    self.users_search = username
    delete_user unless self.osu_users_element.text.include?('No matching records found')
    browser.cookies.clear
  end
end