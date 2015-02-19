require 'fileutils'
require 'rspec'
require 'rspec/expectations'
require 'watir-webdriver'
require 'page-object'
require 'page-object/page_factory'
require 'clipboard'

# Require the generic helpers in lib..
Dir[File.dirname(__FILE__) + '/../../lib/*.rb'].each { |f| require f }

World(PageObject)
World(PageObject::PageFactory)
