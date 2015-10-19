class ContactShare < ActiveRecord::Base

  belongs_to :contact,
    class_name: 'Contact',
    foreign_key: :contact_id,
    primary_key: :id

  belongs_to :user,
    class_name: 'User',
    foreign_key: :user_id,
    primary_key: :id

  has_many :postees, as: :postee 
end
