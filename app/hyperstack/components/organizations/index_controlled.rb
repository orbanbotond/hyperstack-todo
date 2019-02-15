module Organizations
  class IndexControlled < HyperComponent
    param :orgs

    render do
      SECTION do
        UL(class: '') do
          @Orgs.each do |org|
            ::Organizations::Organization(organization: org)
          end
        end
      end
    end
  end
end