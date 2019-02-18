module Organizations
  class Edit < HyperComponent
    param :organization
    param :current_user

    triggers :save
    triggers :cancel
    others   :etc

    after_mount { jQ[dom_node].focus }

    def save_the_org(field, value)
      @Organization.send "#{field}=", value
      if @Organization.new?
        puts "#{field}: #{@value}"
        result = ::Organizations::CreateOperation.run(user: @CurrentUser,
                                             name: @Organization.name,
                                             description: @Organization.description)
          .then {
            puts "Success"
            @Organization = result
          }.fail{ |result|
            puts "Fails"
            puts result
          }
      else
        @Organization.save
      end
      save!
    end

    render(DIV) do
      INPUT(@Etc, 
        defaultValue: @Organization.name,
        placeholder: 'New Organization Name',
        key: @Organization.id)
      .on(:enter) do |event|
        save_the_org(:name, event.target.value)
      end
      .on(:blur) do
        cancel!
      end
      INPUT(@Etc, 
        defaultValue: @Organization.description,
        placeholder: 'New Organization Description')
      .on(:enter) do |event|
        save_the_org(:description, event.target.value)
      end
      .on(:blur) do
        cancel!
      end
    end
  end
end