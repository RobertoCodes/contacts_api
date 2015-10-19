class RemoveAndAddColumnsToLotsOTables < ActiveRecord::Migration
  def change
    remove_column :contact_groups, :contact_id
    add_column :contacts, :contact_group_id, :integer
  end
end
