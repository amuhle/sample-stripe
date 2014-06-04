ENV["RAILS_ENV"] = "test"
require File.expand_path("../../config/environment", __FILE__)
require "rails/test_help"
require "minitest/rails"
require 'capybara/rails'
require "database_cleaner"
require "minitest/rails/capybara"

# Uncomment for awesome colorful output
require "minitest/pride"

class IntegrationTest < MiniTest::Spec
  include Rails.application.routes.url_helpers
  include Capybara::DSL
  register_spec_type(/integration$/, self)
end

class HelperTest < MiniTest::Spec
  include ActiveSupport::Testing::SetupAndTeardown
  include ActionView::TestCase::Behavior
  register_spec_type(/Helper$/, self)
end

class ActiveSupport::TestCase
  ActiveRecord::Migration.check_pending!
  #Adds context to specs like rspec
  class << self
    alias :context :describe
  end
end

class MiniTest::Spec
  #Includes devise and factory_girl helpers
  include FactoryGirl::Syntax::Methods
  include Devise::TestHelpers
end
