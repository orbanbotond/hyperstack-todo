module Organizations
  class IndexContainer < HyperComponent
    def organizations
      ::Organization.member_orgs(current_user.id)
      # ::Organization.all
    end

    def current_user
      User.current
    end

    def dependencies
      [current_user, organizations]
    end

    def guarded_view
      ::Organizations::IndexControlled(organizations: organizations,
                                       current_user: current_user).as_node
    end

    render do
      guarded_view
      # ::Hoc::DependencyGuard(dependencies: dependencies, view: guarded_view)
    end
  end
end