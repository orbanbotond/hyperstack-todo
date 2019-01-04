class TodoList
  include Hyperstack::State::Observable

  class << self
    mutator :add do |todo|
      all << todo
    end

    observer :all do
      # @all ||= Todo.send(match.params[:scope])
      @all ||= Todo.all
    end
  end
end