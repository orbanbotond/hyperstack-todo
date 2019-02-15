class Header < HyperComponent
  include Hyperstack::Router::Helpers

  render(HEADER, class: :header) do
    UL(class: 'nav justify-content-end') do
      LI(class: "nav-item") do
        NavLink( ClientSideRoutes::ORGANIZATIONS, 
          class: "nav-link active", 
          active_class: :selected) do
            "Organizations"
        end
      end
      LI(class: "nav-item") do
        NavLink( ClientSideRoutes::TASKS, 
          class: "nav-link active", 
          active_class: :selected) do
            "Tasks"
        end
      end
    end
  end
end