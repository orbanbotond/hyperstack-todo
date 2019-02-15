class Organization < ApplicationRecord
  has_many :memberships
  has_many :users, through: :memberships

  has_many :projects

  scope :member_orgs, 
        -> (user_id) {User.find(user_id).organizations},
        joins: ['memberships']
        # -> (user_id) {User.find(user_id).organizations}

  # regulate_scope all: true
end
