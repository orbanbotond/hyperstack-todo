module Hoc
  class DependencyGuard < HyperComponent
    param :dependencies
    param :view

    def are_dependencies_loaded?
      @Dependencies.all?{|x|x.loaded?}
    end

    render do
      if are_dependencies_loaded?
        @View.render
      else
        BarLoader(color: "#8AE0D8")
      end
    end
  end
end