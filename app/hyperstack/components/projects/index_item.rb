module Projects
  class IndexItem < HyperComponent
    include Hyperstack::Router::Helpers

    param :project

    render(DIV) do
      NavLink(ClientSideRoutes.project(@Project.id), 
       active_class: :selected) do
        DIV do
          H3 { @Project.name }
          P { @Project.description }
        end
      end
    end
  end
end
