require "rack/test"

ENV["RACK_ENV"] = "test"

require File.join(PROJECT_ROOT, "server.rb")

module RSpecMixin
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end
end

RSpec.configure do |config|
  config.include RSpecMixin
end
