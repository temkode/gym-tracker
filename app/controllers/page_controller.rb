class PageController < ApplicationController
  def index
    @exercise_sets_by_day = ExerciseSet.all
      .group_by { |exercise_set| exercise_set.created_at.beginning_of_day }
      .sort_by { |date, _| -date.to_i }
      .take(5)

    @cumulative_weights_data = {}

    x = @exercise_sets_by_day.reverse

    x.each_with_index do |d, i|
      @cumulative_weights_data[d[0]] = d[1].reduce(i === 0 ? 0 : @cumulative_weights_data[x[i-1][0]]) { |sum, set| sum + ((set.exercise.double_weight ? set.weight_kg * 2 : set.weight_kg) * set.reps * set.sets) }
    end

  end
end
