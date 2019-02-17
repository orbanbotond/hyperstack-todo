module ActiveRecord
  module InstanceMethods
    alias save_before_patch save

    def save(*args, &block)
      save_before_patch(*args, &block).then { |r| r }
    end
  end
end if RUBY_ENGINE=='opal'

class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true
  regulate_scope all: false
end
