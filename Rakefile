require_relative 'config/environment'
require 'sinatra/activerecord/rake'

#DatabaseTasks.db_dir = 'db'
#DatabaseTasks.migrations_paths = ['db/migrate']

desc 'starts a console'
task :console do
  ActiveRecord::Base.logger = nil #Logger.new(STDOUT)
  Pry.start
end
