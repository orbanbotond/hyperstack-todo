class AddItem < Hyperstack::Operation
  param :todo
  outbound :todo

  step { todo.save }
end
