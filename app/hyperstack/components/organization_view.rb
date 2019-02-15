class OrganizationView < HyperComponent
  param :organization

  render(LI) do
    H3{ @Organization.name }
    P{ @Organization.description }
  end
end