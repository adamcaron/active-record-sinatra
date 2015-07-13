require 'bundler'
Bundler.require

# get the path of the root of the app
APP_ROOT = File.expand_path("..", __dir__)

# require the controller(s)
# `Dir.glob` creates an array with whatever matches the following pattern, for instance, anything that ends in ".rb". In this case, we're requireing each of the files in the array. `Dir.glob` is the same thing as `Dir[]`
Dir.glob(File.join(APP_ROOT, 'app', 'controllers', '*.rb')).each { |file| require file }

# require the model(s) ... same thing as above.
Dir.glob(File.join(APP_ROOT, 'app', 'models', '*.rb')).each { |file| require file }

# require database configurations. Comes from app_root, goes into config/ folder, and requires the `database.rb` file
require File.join(APP_ROOT, 'config', 'database')

# configure TaskManagerApp settings. Removes configuration responsibilities from the controller.
class TaskManager < Sinatra::Base
  set :method_override, true
  set :root, APP_ROOT
  set :views, File.join(APP_ROOT, "app", "views")
  set :public_folder, File.join(APP_ROOT, "app", "public")
end
