module Tasks
  class TodoItem < HyperComponent
    param :todo

    render(LI) do
      if(@editing)
        EditItem(class: :edit, todo: @Todo)
        .on(:cancel,:saved) { mutate @editing = false }
      else
        INPUT(type: :checkbox, class: :toggle, checked: @Todo.completed)
        .on(:change) { @Todo.update(completed: !@Todo.completed) }

        LABEL{ @Todo.title}
        .on(:click) { mutate @editing = true }

        A(class: :destroy)
        .on(:click) { @Todo.destroy }
      end
    end
  end
end