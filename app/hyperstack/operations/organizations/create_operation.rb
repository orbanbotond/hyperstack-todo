module Organizations
  class CreateOperation < Hyperstack::Operation
    param :user
    param :name, nils: true
    param :description, nils: true

    step do
      @org = Organization.create name: params.name, 
                          description: params.description
    end

    step do |org|
      if org[:success]
        @organization = org[:models].first
        Membership.create user_id: params.user.id, 
                          organization_id: org[:models].first.id
      end
    end

    step { @organization }
  end
end
