class Exercise < ApplicationRecord
  has_many :exercise_sets, dependent: :destroy
  
  validates :name, presence: true, length: { minimum: 4 }, uniqueness: true

  enum target: {
    upper_body: 0,
    lower_body: 1,
    cardio: 2 
  }
end
