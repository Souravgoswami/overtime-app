ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)

abort 'The Rails environment is running in production mode!' if Rails.env.production?

%w(spec_helper rspec/rails capybara/rails database_cleaner).each(&method(:require))

ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |c|
	c.fixture_path = "#{Rails.root}/spec/fixtures"
	c.use_transactional_fixtures = false
	c.before(:suite) { DatabaseCleaner.clean_with(:truncation) }
	c.before(:each) { DatabaseCleaner.strategy = :truncation }
	c.before(:each, js: true) { DatabaseCleaner.strategy = :truncation }
	c.before(:each) { DatabaseCleaner.start }
	c.after(:each) { DatabaseCleaner.clean }
	c.infer_spec_type_from_file_location!
	c.filter_rails_from_backtrace!
end
