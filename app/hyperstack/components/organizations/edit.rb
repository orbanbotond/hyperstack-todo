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
          @Organization.update(name: event.target.value).then do |result|
            @Organization.users << @CurrentUser
          end
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