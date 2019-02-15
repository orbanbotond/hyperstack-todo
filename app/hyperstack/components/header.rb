class Header < HyperComponent
  include Hyperstack::Router::Helpers

  before_mount { @new_todo = Todo.new }
  render(HEADER, class: :header) do
    UL(class: 'nav justify-content-end') do
      LI(class: "nav-item") do
        NavLink( '/organizations', 
          class: "nav-link active", 
          active_class: :selected) do
            "Organizations"
        end
      end
    end

    EditItem(class: 'new-todo', todo: @new_todo)
    .on(:saved) do
      mutate @new_todo = Todo.new
      TodoList.add(@new_todo)
    end
  end
end