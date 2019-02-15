module Organizations
  class IndexContainer < HyperComponent
    def organizations
      ::Organization.member_orgs(current_user.id)
    end

    def current_user
      User.current
    end

    def dependencies
      [current_user, organizations]
    end

    render do
      ::Hoc::DependencyGuard(dependencies: dependencies, view: ::Organizations::IndexControlled(organizations: organizations).as_node)
    end
  end
end