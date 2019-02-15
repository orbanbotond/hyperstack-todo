module Organizations
  class Show < HyperComponent
    param :organization
    param :current_user

    render(LI) do
      if(@editing)
        Edit(organization: @Organization, current_user: @CurrentUser)
          .on(:cancel, :save) { mutate @editing = false }
      else
        H3{ @Organization.name }
          .on(:click) { mutate @editing = true }
        P{ @Organization.description }
      end
    end
  end
end
