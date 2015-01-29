class HelpCentrePage
  include PageObject
  include RSpec::Matchers
  include DataMagic

  page_url "#{EnvConfig['base_url']}/help-centre"

  text_field :bottom_search, id: 'faqsearch'
  div :search_results, css: '.help-search__results'


end