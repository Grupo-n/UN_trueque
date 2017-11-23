require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require "minitest/reporters"
Minitest::Reporters.use! Minitest::Reporters::SpecReporter.new

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...

  module SampleFileHelper
    def sample_file(filename = "missing.png")
      File.new("test/fixtures/#{filename}")
    end
  end

  class ActiveSupport::TestCase
    include SampleFileHelper
  end
end
