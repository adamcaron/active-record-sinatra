class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.text :first_name
      t.text :last_name

      t.timestamps # optional. Won't break anything if it's not present
    end
  end
end
