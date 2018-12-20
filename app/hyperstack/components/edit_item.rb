class EditItem < HyperComponent
  param :todo

  triggers :saved
  triggers :cancel
  others   :etc

  after_mount { DOM[dom_node].focus }

  render do
    INPUT(@Etc, defaultValue: @Todo.title, key: @Todo)
    .on(:enter) do |evt|
      @Todo.update(title: evt.target.value)
      saved! 
    end
    .on(:blur) do |evt|
      cancel!
    end

  end
end