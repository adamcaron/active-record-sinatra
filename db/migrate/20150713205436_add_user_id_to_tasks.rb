class AddUserIdToTasks < ActiveRecord::Migration
  def change
    add_column :tasks, :user_id, :integer # add a column to the 'tasks' table, make it names 'user_id', make it an integer
  end
end
