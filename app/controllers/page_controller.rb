class PageController < ApplicationController
  def index
    @exercise_sets_by_day = ExerciseSet.all
      .group_by { |exercise_set| exercise_set.created_at.beginning_of_day }
      .take(5)
  end
end
