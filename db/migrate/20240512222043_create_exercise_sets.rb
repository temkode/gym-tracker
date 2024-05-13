class CreateExerciseSets < ActiveRecord::Migration[7.1]
  def change
    create_table :exercise_sets do |t|
      t.integer :reps
      t.integer :sets
      t.integer :weight_kg
      t.integer :difficulty
      t.references :exercise, null: false, foreign_key: true

      t.timestamps
    end
  end
end
