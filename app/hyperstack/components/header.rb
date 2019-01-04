class Header < HyperComponent
  before_mount { @new_todo = Todo.new }
  render(HEADER, class: :header) do
    EditItem(class: 'new-todo', todo: @new_todo)
    .on(:saved) do
			mutate @new_todo = Todo.new
    	TodoList.add(@new_todo)
    end
  end
end