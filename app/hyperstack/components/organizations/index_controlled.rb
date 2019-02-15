module Organizations
  class IndexControlled < HyperComponent
    param :organizations

    render do
      SECTION do
        UL(class: '') do
          @Organizations.each do |org|
            ::Organizations::Show(organization: org)
          end
        end
      end
    end
  end
end