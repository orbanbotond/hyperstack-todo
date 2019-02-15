class Meeting < ApplicationRecord
  belongs_to :project

  has_many :decisions
  has_many :learnings
  has_many :notes
  has_many :tasks
end
