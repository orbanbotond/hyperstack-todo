class OrganizationsControlled < HyperComponent
  param :organizations

  render do
    SECTION do
      UL(class: '') do
        @Organizations.each do |org|
          OrganizationView(organization: org)
        end
      end
    end
  end
end
