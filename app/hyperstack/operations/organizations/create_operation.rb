module Organizations
  class CreateOperation < Hyperstack::Operation
    param :user
    param :name
    param :description

    step do
      puts "step1"
      Organization.create name: name, 
                          description: description
    end

    step do |result| 
      puts "step2"
      Membership.create user_id: user.id, 
                        organization_id: result[:models].first.id
    end
  end
end
