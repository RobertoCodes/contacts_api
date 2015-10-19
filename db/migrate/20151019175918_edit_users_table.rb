class EditUsersTable < ActiveRecord::Migration
  def change
    add_column :users, :username, :string, presence: true, uniqueness: true
    remove_column :users, :name, :email 
  end
end
