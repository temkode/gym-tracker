class PageController < ApplicationController
  def index
    @exercise_sets_by_day = ExerciseSet.bruh.first(5)
    # binding.pry
    @cumulative_weights_data = ExerciseSet.cumulative_weights
  end
end
