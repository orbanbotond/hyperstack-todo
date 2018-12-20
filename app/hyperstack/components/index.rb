class Index < HyperComponent
  include Hyperstack::Router::Helpers

  render(SECTION) do
    UL do
      Todo.send(match.params[:scope]).each do |todo|
        TodoItem(todo: todo)
      end
    end
  end
end