require "bundler/setup"
require "sinatra/activerecord"
require "sinatra"
require "sinatra/reloader" if development?

Dir["#{File.dirname(__FILE__)}/**/*.rb"].each{ |f| also_reload f}


# Load models
require_relative 'models/recipe'
require_relative 'models/course'
require_relative 'models/ingredient'


ActiveRecord::Base.establish_connection({
  database: 'cookbook',
  adapter: 'postgresql'
})


# Close connection
after do
  ActiveRecord::Base.connection.close
end

# General route actions
get '/' do
  erb :home
end
