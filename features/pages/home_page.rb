class HomePage
  include PageObject
  include RSpec::Matchers

  page_url "#{EnvConfig["base_url"]}"

  link :signupLogo, title: 'Online sign up - Click here to begin'
  link :empoyersSignup, text: 'Employers sign up here'
  link :loginLink, text: 'Login'
  text_field :email_field, id: 'osuloginemail'
  text_field :password_field, id: 'osuloginpassword'

end