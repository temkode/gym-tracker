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

  private 

  def date_must_be_in_the_past_or_present
    errors.add(:created_at, "can't be in the future") unless created_at.past?
  end
end
