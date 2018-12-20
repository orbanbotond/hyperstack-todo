class Header < HyperComponent
  before_mount { @new_todo = Todo.new }
  render(HEADER) do
    EditItem(todo: @new_todo)
    .on(:saved) { mutate @new_todo = Todo.new }
  end
end