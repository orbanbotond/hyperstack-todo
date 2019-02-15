module Organizations
  class Organization < HyperComponent
    param :organization

    render(LI) do
      H3{ @Organization.name }
      P{ @Organization.description }
    end
  end
end