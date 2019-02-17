module Organizations
  class CreateOperation < Hyperstack::Operation
    param :user
    param :name
    param :description, nils: true

    step do
      Organization.create name: params.name, 
                          description: params.description
    end

    step do |org|
      if org[:success]
        Membership.create user_id: params.user.id, 
                          organization_id: org[:models].first.id
      end
    end
  end
end
