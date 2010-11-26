ENV["RAILS_ENV"] = "test"
DEVISE_ORM = (ENV["DEVISE_ORM"] || :couchrest_model).to_sym
DEVISE_PATH = ENV['DEVISE_PATH']

puts "\n==> Devise.orm = #{DEVISE_ORM.inspect}"

require "rails_app/config/environment"
require "rails/test_help"
require "orm/#{DEVISE_ORM}"

require "couchrest"
require "couchrest_model"

TEST_SERVER = CouchRest.new("http://admin:admin@127.0.0.1:5984")
TEST_SERVER.default_database = 'devise_couch'

I18n.load_path << "#{DEVISE_PATH}/test/support/locale/en.yml"

require 'mocha'
require 'webrat'
Webrat.configure do |config|
  config.mode = :rails
  config.open_error_files = false
end

Devise::OmniAuth.test_mode!

# Add support to load paths so we can overwrite broken webrat setup
$:.unshift "#{DEVISE_PATH}/test/support"
Dir["#{DEVISE_PATH}/test/support/**/*.rb"].each { |f| require f }
