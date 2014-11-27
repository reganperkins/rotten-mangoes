class AddRoleToUsers < ActiveRecord::Migration
  def change
    add_column :users, :role, :integer, defualt: 0
  end
end
