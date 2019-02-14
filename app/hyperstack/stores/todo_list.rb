class TodoList
  include Hyperstack::State::Observable

  # receives AddItem do 
  #   all << params.todo
  # end

  # class << self
  #   state_accessor :all do
  #     @all ||= Todo.all
  #   end
  # end

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