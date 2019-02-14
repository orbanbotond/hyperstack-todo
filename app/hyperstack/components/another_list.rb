class AnotherList < HyperComponent
  include Hyperstack::Router::Helpers

  render(DIV, class: :footer) do
    UL do
      TodoList.all.each do |todo|
        LI do
          todo.title
        end
      end
    end
    DIV do
      H6 {"Helloworld - #{User.current.email}"}
    end
  end
end
