class PageController < ApplicationController
  def index
    @exercise_sets_by_day = ExerciseSet.all
      .group_by { |exercise_set| exercise_set.created_at.beginning_of_day }
      .sort_by { |date, _| -date.to_i }
      .take(5)
  end
end
