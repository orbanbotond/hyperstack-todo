class Index < HyperComponent
  render(SECTION) do
    UL do
      Todo.each do |todo|
      # Todo.all.each do |todo|
        TodoItem(todo: todo)
      end
    end
  end
end