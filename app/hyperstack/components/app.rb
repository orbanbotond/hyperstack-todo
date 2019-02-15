# app/hyperstack/component/app.rb

# This is your top level component, the rails router will
# direct all requests to mount this component.  You may
# then use the Route psuedo component to mount specific
# subcomponents depending on the URL.

class App < HyperComponent
  include Hyperstack::Router

  # define routes using the Route psuedo component.  Examples:
  # Route('/foo', mounts: Foo)                : match the path beginning with /foo and mount component Foo here
  # Route('/foo') { Foo(...) }                : display the contents of the block
  # Route('/', exact: true, mounts: Home)     : match the exact path / and mount the Home component
  # Route('/user/:id/name', mounts: UserName) : path segments beginning with a colon will be captured in the match param
  # see the hyper-router gem documentation for more details

  render do
    SECTION(class: 'todo-app') do
      # BarLoader(color: "#8AE0D8")
      Header()
      Switch do
        Route(ClientSideRoutes::ORGANIZATIONS, 
          exact: true, 
          mounts: Organizations::IndexContainer)
        Route(ClientSideRoutes::TASKS, exact: true) { Redirect("#{ClientSideRoutes::TASKS}/all") }
        Route("#{ClientSideRoutes::TASKS}/:scope", mounts: Index)
      end
      Footer() unless Todo.count.zero?
      AnotherList()
    end
  end
end
