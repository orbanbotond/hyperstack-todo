class EditItem < HyperComponent
  param :todo

  render do
    INPUT(defaultValue: @Todo.title)
    .on(:enter) do |evt|
      @Todo.update(title: evt.target.value)
    end
  end
end