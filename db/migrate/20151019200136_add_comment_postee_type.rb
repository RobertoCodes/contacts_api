class AddCommentPosteeType < ActiveRecord::Migration
  def change
    add_column :comments, :postee_type, :string
  end
end
