module Organizations
  class IndexItem < HyperComponent
    include Hyperstack::Router::Helpers

    param :organization
    param :current_user

    render(LI) do
      NavLink(ClientSideRoutes.organization(@Organization.id), 
       active_class: :selected) do
        DIV do
          H3{ @Organization.name }
          P{ @Organization.description }
        end
      end
    end
  end
end
