class ApplicationPage
  include PageObject
  include RSpec::Matchers
  include DataMagic

  page_url "#{EnvConfig["base_url"]}/sign-up/payroll-bureau/"

  button :continue, id: "next-button"
  button :save, id: "save-button"
  button :choose_101_plan, css: "div.link.\\31 01 button"
  link :start_new_application, text: "Start a new application"
  link :manage_applications, text: "Manage applications"
  link :continue_application, text: "Continue Application"
  link :continue_link, text: "Continue"
  link :delete_link, text: "Delete"
  list_item :first_step_active, css: "ul.osu-steps li:nth-child(1).osu-steps--active"
  list_item :second_step_active, css: "ul.osu-steps li:nth-child(2).osu-steps--active"
  list_item :third_step_active, css: "ul.osu-steps li:nth-child(3).osu-steps--active"
  list_item :fourth_step_active, css: "ul.osu-steps li:nth-child(4).osu-steps--active"
  list_item :fift_step_active, css: "ul.osu-steps li:nth-child(5).osu-steps--active"
  list_item :sixt_step_active, css: "ul.osu-steps li:nth-child(6).osu-steps--active"
  radio_button :step1_no, id: "has_bureau-1"
  table :active_applications_table, css: "div#primary table"

  text_field :employer_name_legal, id: "company_name_legal"
  text_field :employer_name_known, id: "company_name_aka"
  select_list :staging_date, id: "staging_date"
  radio_button :plan_start_date_no, id: "start_early-1"
  select_list :organization_description, id: "company_type-1"
  text_field :company_reg_number, id: "company_registration_no"
  text_field :company_address, id: "company_address1"
  text_field :company_city, id: "company_city"
  text_field :company_postcode, id: "company_postcode"
  select_list :no_of_included_employees, id: "no_of_included_employees"
  text_field :primary_contact_name, id: "primary_contact_name-0"
  text_field :primary_contact_email, id: "primary_contact_email-0"
  text_field :primary_contact_email2, id: "primary_contact_email_confirm-0"
  text_field :primary_contact_job, id: "primary_contact_title-0"
  text_field :primary_contact_phone, id: "primary_contact_phone-0"
  text_field :paye_reference, id: "paye_ref-0"
  text_field :payroll_known_as, id: "payrolls-0-payroll_name-0"
  text_field :payroll_contact_name, id: "payrolls-0-payroll_contact_name-0"
  text_field :payroll_contact_email, id: "payrolls-0-payroll_contact_email-0"
  text_field :payroll_contact_email2, id: "payrolls-0-payroll_contact_email_confirm-0"
  text_field :payroll_contact_phone, id: "payrolls-0-payroll_contact_phone-0"
  text_field :payroll_software_provider, css: "fieldset#payroll_0 div:nth-child(7) input"

  link :see_plan_summary, text: "See Plan Summary"
  link :download_draft_agreement, text: "Download Draft Agreement"

  div :share_this_page, id: "accept-agreement-confirmation"
  button :send_button, text: "Send"

  link :yes, text: "Yes"
  text_field :accepted_first_name, id: "accepted-by-first-name-1"
  text_field :accepted_last_name, id: "accepted-by-last-name-1"
  text_field :accepted_job, id: "accepted-by-job-title-1"
  text_field :accepted_email, id: "accepted-by-email-1"
  text_field :accepted_email2, id: "accepted-by-email-confirm-0"
  button :accepted_continue, id: "signatory-continue"
  checkbox :accepted_i_apply, id: "acceptance-checkbox"
  link :accepted_final_continue, id: "final-acceptance"


  def complete_adviser_application(data = {})
    populate_page_with data_for(:adviser_application, data)
  end

  def complete_employer_application(data = {})
    populate_page_with data_for(:employer_application, data)
  end

  def complete_paye_info(data = {})
    populate_page_with data_for(:employer_application_paye, data)
  end

  def delete_employer_applications
    # TODO: to be continued...
  end

  def modal_confirmation
    sleep 2
    yes
    self.accepted_first_name = 'Confirmed'
    self.accepted_last_name = 'Accepted'
    self.accepted_job = 'good to go'
    self.accepted_email = 'jenkins+yes@experiencematter.co.uk'
    self.accepted_email2 = 'jenkins+yes@experiencematter.co.uk'
    accepted_continue
    check_accepted_i_apply
    accepted_final_continue
  end

end