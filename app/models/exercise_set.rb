class ExerciseSet < ApplicationRecord
  belongs_to :exercise

  enum difficulty: {
    easy: 0,
    medium: 1,
    hard: 2 
  }
end
