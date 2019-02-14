class User < ApplicationRecord
  unless RUBY_ENGINE == 'opal'
     # other code that should not be compiled to the client...
    # Include default devise modules. Others available are:
    # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
    devise :database_authenticatable, :registerable,
           :recoverable, :rememberable, :validatable
  end

  def self.current
    puts Hyperstack::Application.acting_user_id
    puts Hyperstack::Application.acting_user_id
    puts Hyperstack::Application.acting_user_id
    puts Hyperstack::Application.acting_user_id
    Hyperstack::Application.acting_user_id ? find(Hyperstack::Application.acting_user_id) : User.new
  end
end
