class MakeExerciseNameUnique < ActiveRecord::Migration[7.1]
  def change
    add_index :exercises, :name, unique: true
  end
end
