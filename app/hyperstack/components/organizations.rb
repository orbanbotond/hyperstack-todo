class Organizations < HyperComponent
  def organizations
    Organization.member_orgs(current_user.id)
  end

  def current_user
    User.current
  end

  def dependencies
    [current_user, organizations]
  end

  # render do
  #   DependencyGuard(dependencies: dependencies, view: OrganizationsControlled(organizations: organizations).as_node)
  # end

  def are_dependencies_loaded?
    dependencies.all?{|x|x.loaded?}
  end

  render do
    if are_dependencies_loaded?
      OrganizationsControlled(organizations: organizations)
    else
      BarLoader(color: "#8AE0D8")
    end
  end
end