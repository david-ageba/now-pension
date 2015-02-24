class ApplicationPage
  include PageObject
  include RSpec::Matchers
  include DataMagic

  page_url "#{EnvConfig["base_url"]}/sign-up/payroll-bureau/"

  button :continue, id: "next-button"
  button :save, id: "save-button"
  button :choose_101_plan, css: "td.link.\31 01 input[value='Choose plan']"
  link :start_new_application, text: "Start a new application"
  link :manage_applications, text: "Manage applications"
  link :continue_link, text: "Continue"
  list_item :first_step_active, css: "ul.osu-steps li:nth-child(1).osu-steps--active"
  list_item :second_step_active, css: "ul.osu-steps li:nth-child(2).osu-steps--active"
  list_item :third_step_active, css: "ul.osu-steps li:nth-child(3).osu-steps--active"
  list_item :fourth_step_active, css: "ul.osu-steps li:nth-child(4).osu-steps--active"
  list_item :fift_step_active, css: "ul.osu-steps li:nth-child(5).osu-steps--active"
  list_item :sixt_step_active, css: "ul.osu-steps li:nth-child(6).osu-steps--active"
  radio_button :step1_no, id: "has_bureau-1"
  table :active_applications_table, css: "div#primary table"


end