class Footer < HyperComponent
  include Hyperstack::Router::Helpers

  def link_item(path)
    NavLink("/#{path}", style: { marginRight: 10 }) { path.camelize }
  end

  render(DIV) do
    link_item(:all)
    link_item(:active)
    link_item(:completed)
  end
end
