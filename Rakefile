ENV["SINATRA_ENV"] ||= "development"

require_relative './config/environment'
require 'sinatra/activerecord/rake'

task :drop do
  system('rm db/development.sqlite && rm db/test.sqlite && db/schema.rb')
end

task :migrations do
  system('rake db:migrate && rake db:migrate SINATRA_ENV=test')
end
