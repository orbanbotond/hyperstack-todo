class TodoItem < HyperComponent
  param :todo

  render(LI) do
    if(@editing)
      EditItem(todo: @Todo)
      .on(:cancel,:saved) { mutate @editing = false }
    else
      INPUT(type: :checkbox, checked: @Todo.completed)
      .on(:change) { @Todo.update(completed: !@Todo.completed) }
      LABEL{ @Todo.title}
      .on(:click) { mutate @editing = true }
      A { ' -X-' }.on(:click) { @Todo.destroy }
    end
  end
end