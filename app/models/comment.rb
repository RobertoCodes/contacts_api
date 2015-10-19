class Comment < ActiveRecord::Base
  validates :body, :poster_id, :postee_id, presence: true
  validates :postee_type, inclusion: { in: %w(Contact User ContactShare),
      message: "%{value} is wrong." }
      
  belongs_to :poster,
    class_name: "User",
    foreign_key: :poster_id,
    primary_key: :id

  belongs_to :postee, polymorphic: true


end
