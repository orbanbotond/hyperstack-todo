class Project < ApplicationRecord
  has_many :meetings
  belongs_to :organization
end
