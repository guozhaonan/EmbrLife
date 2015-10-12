class ChangeHabtmTables < ActiveRecord::Migration
  def change
    drop_table :ideas_users
  end
end
