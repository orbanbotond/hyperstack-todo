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
          puts "Runing the operation"
          ::Organizations::CreateOperation.run(user: @CurrentUser,
                                               name: event.target.value,
                                               desciption: nil)
          # puts "Saving!"
          # @Organization.update(name: event.target.value).then do |result|
          #   puts "Saved!"
          #   if result[:success]
          #     puts result[:models].first
          #     puts result[:models].first.id
          #     puts @CurrentUser.id
          #     puts "Email:#{@CurrentUser.email}"
          #     # result[:models].first.users << @CurrentUser
          #     Membership.create user_id: @CurrentUser.id, 
          #                       organization_id: result[:models].first.id
          #     puts "Created the membership!"
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