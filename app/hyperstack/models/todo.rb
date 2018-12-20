class Todo < ApplicationRecord
  scope :completed, -> { where(completed: true)  }
  scope :active,    -> { where(completed: false).or(self.where(completed: nil)) }
end
