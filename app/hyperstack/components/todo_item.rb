class TodoItem < HyperComponent
  param :todo

  render(LI) do
    INPUT(type: :checkbox, checked: @Todo.completed)
    .on(:change) { @Todo.update(completed: !@Todo.completed) }
    EditItem(todo: @Todo)
    A { ' -X-' }.on(:click) { @Todo.destroy }
  end
end