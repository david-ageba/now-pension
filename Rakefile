# Contains rake tasks to make it easier to run cucumber from terminal.

require 'rubygems'
require 'cucumber'
require 'cucumber/rake/task'
require 'rubocop/rake_task'


profiles = YAML::load(File.open(File.join(Dir.pwd, 'cucumber.yml')))
profiles.each do |name, value|
  desc "Run profile #{name}: #{value}"
  Cucumber::Rake::Task.new(name.to_sym, "Run profile #{name}: #{value}") do |t|
    t.profile = name
  end
end

desc "Runs all features and outputs to HTML and rerun.txt"
Cucumber::Rake::Task.new(:all, "Output an HTML report and rerun.txt file to reports/") do |t|
  t.profile = 'default'
  t.cucumber_opts = '-c --format pretty --format html --out results/test_report.html --format json --out results/json_report.json -f rerun --out results/rerun.txt'
  puts "Running tests on #{ENV['CONFIG']} environment,"
  puts "using browser: #{ENV['BROWSER']}"
end

desc "Rerun tests output by rake:output"
Cucumber::Rake::Task.new(:rerun, "Rerun failed scenarios from 'report' rake task") do |t|
  t.profile = 'default'
  t.cucumber_opts = "@results/rerun.txt -r features"
end

desc "Run with tags"
Cucumber::Rake::Task.new(:t, "Run 'all' profile, pass tags as args.") do |t|
  t.profile = 'all'
  ARGV.shift #Ignore the first value in ARGV (it will be the rake task name)
  options = ""
  ARGV.each do |tag|
    options.concat("--tags #{tag} ") if tag.match(/^(?:@|~)/) #Only add arguments that begin with '@' or '~'.
  end
  t.cucumber_opts = options
end

task(:help, "Show additional flags available") do
  message = <<-MESSAGE

Run 'rake -T' to see the available rake tasks.

Run 'rubocop' to check that your ruby code conforms to the styleguide.

---------------------------------------------------
Optional flags to pass into the Environment:

  CONFIG=staging, dev, or live (defaults to 'dev')
  BROWSER=firefox, chrome or ie (defaults to 'firefox')
--------------------------------------------------

Example:

    rake t @wip ~@manual CONFIG=uat BROWSER=ie

Result:

    Executes all tests tagged with @wip except those
     tagged with @manual, and sets two environment
     variables: CONFIG and BROWSER.

 --------------------------------------------------

  MESSAGE
  puts message
end