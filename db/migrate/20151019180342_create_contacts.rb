class CreateContacts < ActiveRecord::Migration
  def change
    create_table :contacts do |t|
      t.string :name, presence: true
      t.string :email, presence: true, uniqueness: {:scope => :user_id}
      t.integer :user_id,presence: true

      t.timestamps
    end
  end
end
