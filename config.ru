# Load path and gems/bundler
set :root, File.dirname(__FILE__)

require "bundler"
Bundler.require

# Local config
require "find"

%w{config/initializers lib}.each do |load_path|
  Find.find(load_path) { |f|
    require f unless f.match(/\/\..+$/) || File.directory?(f)
  }
end

# Load app
require "test_calc"
run TestCalc