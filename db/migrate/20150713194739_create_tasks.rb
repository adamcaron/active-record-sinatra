class CreateTasks < ActiveRecord::Migration
  def change
    # this block allows us to define the columns we want. `create_table` is a method from Migration which accepts a parameter that is a symbol which is the name of the table, then it takes a block used to specify which columsn we want.
    create_table :tasks do |t|
      # enter the column type, then pass it the parameter in a symbol representing the column name...
      t.text :title
      t.text :description

      # gives us two extra columns, created_at & updated_at, these are automatically managed by ActiveRecord. This are optional.
      t.timestamps
    end
  end
end
