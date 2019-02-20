module Projects
  class Index < HyperComponent
    param :projects

    render(DIV) do
      H4 { "Projects" }
      UL(class: '') do
        @Projects.each do |project|
          ::Projects::IndexItem(project: project)
        end
      end
    end
  end
end
