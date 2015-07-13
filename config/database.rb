# set the database based on the current environment.
database_name = "task-manager-#{TaskManager.environment}"

# connect ActiveRecord with the current database
ActiveRecord::Base.establish_connection(
  # adapter represents the database that we're using, like sqlite or postgresql
  :adapter  => "sqlite3",
  # the following simply sets the name of the database
  :database => "db/#{database_name}",
)
