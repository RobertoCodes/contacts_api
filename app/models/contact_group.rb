class ContactGroup < ActiveRecord::Base

  has_many :contacts,
    class_name: 'Contact',
    foreign_key: :contact_group_id,
    primary_key: :id

  belongs_to :user,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id

end
