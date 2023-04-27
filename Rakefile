# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require_relative "config/application"

task test: :environment do
  require 'simplecov'
  SimpleCov.start do
    command_name "rails_test"
    add_filter "/test/"
    add_filter "/config/"
    track_files "{app,lib}/**/*.rb"
  end

  sh "rails test"
end


Rails.application.load_tasks
