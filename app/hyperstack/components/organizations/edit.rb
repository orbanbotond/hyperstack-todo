module Organizations
  class Edit < HyperComponent
    param :organization

    triggers :save
    triggers :cancel
    others   :etc

    after_mount { DOM[dom_node].focus }

    render do
      INPUT(@Etc, 
        defaultValue: @Organization.name,
        key: @Organization)
      .on(:enter) do |event|
        @Organization.update(name: event.target.value)
        save! 
      end
      .on(:blur) do |event|
        cancel!
      end
    end
  end
end