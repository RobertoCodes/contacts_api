class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true


  has_many :contacts,
    dependent: :destroy,
    class_name: 'Contact',
    foreign_key: :user_id,
    primary_key: :id

  has_many :contact_shares,
    dependent: :destroy,
    class_name: 'ContactShare',
    foreign_key: :user_id,
    primary_key: :id

  has_many :shared_contacts,
    through: :contact_shares,
    source: :contact

  has_many :posts,
    class_name: "Comment",
    foreign_key: :poster_id,
    primary_key: :id

  has_many :postees, as: :postee

  has_many :contact_groups,
    class_name: 'ContactGroup',
    foreign_key: :user_id,
    primary_key: :id

end
