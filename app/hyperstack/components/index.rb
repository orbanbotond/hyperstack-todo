class Index < HyperComponent
  include Hyperstack::Router::Helpers
  before_mount { @new_todo = Todo.new }

  render do
    SECTION(class: 'todo-app') do
      EditItem(class: 'new-todo', todo: @new_todo)
      .on(:saved) do
        mutate @new_todo = Todo.new
        TodoList.add(@new_todo)
      end
      UL(class: 'todo-list') do
        Todo.send(match.params[:scope]).each do |todo|
          TodoItem(todo: todo)
        end
      end
      Footer() unless Todo.count.zero?
      AnotherList()
    end
  end
end