module Organizations
  class Detailed < HyperComponent
    include Hyperstack::Router::Helpers

    def organization
      @organization ||= Organization.find match.params[:id]
    end

    render(DIV) do
      DIV do
        H3 { organization.name }
        P { organization.description }
      end
      Projects::Index(projects: organization.projects)
    end
  end
end
