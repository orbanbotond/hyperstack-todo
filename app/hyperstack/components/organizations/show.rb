module Organizations
  class Show < HyperComponent
    param :organization
    param :current_user

    render(LI) do
      if(@editing)
        Edit(organization: @Organization, current_user: @CurrentUser)
          .on(:cancel, :save) { mutate @editing = false }
      else
        DIV do
          H3{ @Organization.name }
          P{ @Organization.description }
        end
        .on(:click) { mutate @editing = true }
      end
    end
  end
end
