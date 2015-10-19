class Contact < ActiveRecord::Base
  validates :name, :user_id, presence: true
  validates :email, presence: true, uniqueness: {:scope => :user_id}
  validate :contact_group_exists

  belongs_to :owner,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id

  has_many :contact_shares,
    dependent: :destroy,
    class_name: 'ContactShare',
    foreign_key: :contact_id,
    primary_key: :id

  has_many :shared_users,
    through: :contact_shares,
    source: :user

  has_many :postees, as: :postee

  belongs_to :contact_group,
    class_name: 'ContactGroup',
    foreign_key: :contact_group_id,
    primary_key: :id


  def contact_group_exists
    group_id = self.contact_group_id
    unless ContactGroup.find(group_id)
      errors.add(:contact_group_exists, "contact group needs to exist.")
    end
  end
end
