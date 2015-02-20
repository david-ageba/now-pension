class ResetPasswordPage
  include PageObject
  include RSpec::Matchers
  include DataMagic

  page_url "#{EnvConfig["base_url"]}/login/#reset"

  text_field :reset_pass_email, id: "osuemail_reset"
  button :reset_pass_button, css: "#osu-reset-form form div.osu-widget-buttons button"
  div :login_form, css: "div.nine"

  def setRandomEmail
    self.reset_pass_email = "#{Utility.get_random_string(10)}@example.com"
  end


end