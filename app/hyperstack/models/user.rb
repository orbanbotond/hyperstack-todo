class User < ApplicationRecord
  unless RUBY_ENGINE == 'opal'
     # other code that should not be compiled to the client...
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  end

  has_many :memberships
  has_many :organizations, through: :memberships

  def self.current
    Hyperstack::Application.acting_user_id ? find(Hyperstack::Application.acting_user_id) : User.new
  end

  def full_name
    "#{first_name} #{last_name}"
  end
end
