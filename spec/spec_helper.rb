# encoding: UTF-8

require 'bundler'

Bundler.setup
Bundler.require

ENV["RACK_ENV"] = "test"

require 'rack/test'
require 'rspec'

RSpec.configure do |conf|
  conf.include Rack::Test::Methods
  def app() Sinatra::Application end
end

require "find"
%w{./config/initializers ./lib}.each do |load_path|
  Find.find(load_path) { |f| require f if f.match(/\.rb$/) }
end