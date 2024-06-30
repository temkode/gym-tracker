class ExerciseSet < ApplicationRecord
  belongs_to :exercise

  validates :reps, presence: true
  validates :sets, presence: true
  validates :weight_kg, presence: true
  validate :date_must_be_in_the_past_or_present

  enum difficulty: {
    easy: 0,
    medium: 1,
    hard: 2 
  }

  scope :grouped_by_day, -> {
    select('date(created_at) as ordered_date, *')
      .order('ordered_date ASC')
      .group_by { |es| es.created_at.beginning_of_day }
  }

  scope :recent_group_by_day, -> {
    select('date(created_at) as ordered_date, *')
      .order('ordered_date DESC')
      .group_by { |es| es.created_at.beginning_of_day }
  }

  def self.cumulative_weights
    grouped_by_day.each_with_object({}).with_index do |((date, sets), cumulative_weights_data), i|
      cumulative_weights_data[date] = sets.reduce(i.zero? ? 0 : cumulative_weights_data.values.last) do |sum, set|
        sum + weight_for_set(set)
      end
    end
  end

  private

  def self.weight_for_set(set)
    set_weight = set.exercise.double_weight ? set.weight_kg * 2 : set.weight_kg
    set_weight * set.reps * set.sets
  end

  def date_must_be_in_the_past_or_present
    errors.add(:created_at, "can't be in the future") unless created_at.past?
  end
end
