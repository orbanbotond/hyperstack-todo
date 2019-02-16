module Organizations
  class Edit < HyperComponent
    param :organization
    param :current_user

    triggers :save
    triggers :cancel
    others   :etc

    after_mount { DOM[dom_node].focus }

    render do
      INPUT(@Etc, 
        defaultValue: @Organization.name,
        placeholder: 'New Organization Name',
        key: @Organization.id)
      .on(:enter) do |event|
        if @Organization.new?
          ::Organizations::CreateOperation.run(user: @CurrentUser,
                                               name: event.target.value,
                                               description: nil)
            .then{
            }.fail{ |result|
            }

          # @Organization.update(name: event.target.value).then do |result|
          #   if result[:success]
          #     Membership.create user_id: @CurrentUser.id, 
          #                       organization_id: result[:models].first.id
          #   end
          # end
        else
          @Organization.update(name: event.target.value)
        end
        save!
      end
      .on(:blur) do |event|
        cancel!
      end
    end
  end
end