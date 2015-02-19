class RegistrationPage
  include PageObject
  include RSpec::Matchers
  include DataMagic

  page_url "#{EnvConfig["base_url"]}/employers/register"

  # common fields
  text_field :first_name, name: "osu_user[first_name]"
  text_field :last_name, name: "osu_user[last_name]"
  text_field :email, name: "osu_user[email]"
  text_field :repeat_email, name: "osu_user[email2]"
  text_field :microsite_email, name: "osu_user[bureau-microsite-email]"
  text_field :password, name: "osu_user[password]"
  text_field :repeat_password, name: "osu_user[password2]"
  text_field :organisation, name: "osu_user[company]"
  text_field :phone_number, name: "osu_user[phone]"
  text_field :job_title, name: "osu_user[job_title]"
  text_field :fca_number, name: "osu_user[fca_number]"
  text_field :branch_postcode, name: "osu_user[postcode]"

  # payroll bureau fields
  text_field :reg_number, name: "osu_user[bureau-reg-no]"
  text_field :address_line1, name: "osu_user[bureau-address-1]"
  text_field :postcode, name: "osu_user[bureau-address-postcode]"
  select :payroll_software, id: "bureau-payroll-software"
  checkbox :setup_on_microsite, id: "osubureau-setup-on-microsite"
  checkbox :perform_ae_assessment, id: "osubureau-perform-ae-assessment"
  checkbox :er_data_to_microsite, id: "osubureau-er-to-microsite"
  checkbox :update_payroll, id: "osubureau-update-payroll"
  checkbox :forward_ddm, id: "osubureau-forward-ddm"

  button :register, name: "osu-widget"
  link :get_started, css: "a.button--large"

  element :step_one_completed, :section, xpath: "//section[@class='journey__step journey__step--one journey__step--active journey__step--check']"
  element :step_two_completed, :section, xpath: "//section[@class='journey__step journey__step--two journey__step--active journey__step--check']"
  link :login_button, css: "section.journey__step--two a"

  def complete_registration_info(user_role, data = {})
    case user_role
      when 'Employer'
        populate_page_with data_for(:employer_registration_info, data)
      when 'Adviser'
        populate_page_with data_for(:adviser_registration_info, data)
      when 'Payroll'
        populate_page_with data_for(:payroll_registration_info, data)
    end
  end
end