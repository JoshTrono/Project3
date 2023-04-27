# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"
require 'simplecov'
SimpleCov.start

task test: :environment do
  require 'simplecov'
  SimpleCov.start do
    add_filter 'test/'
    track_files 'app/**/*.rb'
  end

  sh "rails test"
end


Rails.application.load_tasks
