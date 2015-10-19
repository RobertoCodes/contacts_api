class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :body
      t.integer :poster_id
      t.integer :postee_id

      t.timestamps
    end
  end
end
