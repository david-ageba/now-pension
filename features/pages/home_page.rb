class HomePage
  include PageObject
  include RSpec::Matchers

  page_url "#{EnvConfig["base_url"]}"

  link :signupLogo, title: 'Online sign up - Click here to begin'
  link :empoyersSignup, text: 'Employers sign up here'
  link :press, text: 'Press'
  link :loginLink, text: 'Login'
  text_field :email_field, id: 'osuloginemail'
  text_field :password_field, id: 'osuloginpassword'
  link :magnifier, css: 'a.tab-search__trigger'
  text_field :search_top_right, id: 's'
  link :help_centre, text: 'Help Centre'
  link :employers, text: 'Employers'

  link :employer_button, text: 'Employer'
  link :employee_button, text: 'Employee'
  link :adviser_button, text: 'Adviser'
  link :payroll_bureau_button, text: 'Payroll Bureau'

  h3 :homepage_heading, id: 'osu_lead_heading'
  link :help_centre_button, css: 'ul#osu_lead_secondary li:nth-child(2) a'

  def getmail
    puts GoogleMail.get_last_unread_mail
  end

end