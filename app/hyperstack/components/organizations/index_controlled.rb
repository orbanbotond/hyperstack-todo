module Organizations
  class IndexControlled < HyperComponent
    param :organizations
    param :current_user

    before_mount { @new_organization = Organization.new }

    render do
      SECTION do
        UL(class: '') do
          @Organizations.each do |org|
            ::Organizations::Show(organization: org)
          end
        end
        Edit(organization: @new_organization,
             current_user: @CurrentUser)
          .on(:save) do
            mutate @new_organization = Organization.new
          end
      end
    end
  end
end