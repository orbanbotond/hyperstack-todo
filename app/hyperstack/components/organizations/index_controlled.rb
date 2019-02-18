module Organizations
  class IndexControlled < HyperComponent
    param :organizations
    param :current_user

    before_mount { @new_organization = Organization.new }

    render do
      SECTION do
        UL(class: '') do
          @Organizations.each do |org|
            ::Organizations::Show(organization: org, user: @CurrentUser)
          end
        end
        if @addingNew
          Edit(organization: @new_organization,
               current_user: @CurrentUser)
            .on(:save) do
              mutate @new_organization = Organization.new
            end
        else
          BUTTON type:"button", class:"btn btn-success" do
            "Add New Org"
          end
          .on(:click) do
              mutate @addingNew = true
          end
        end
      end
    end
  end
end