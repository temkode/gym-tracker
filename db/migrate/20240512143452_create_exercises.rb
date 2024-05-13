class CreateExercises < ActiveRecord::Migration[7.1]
  def change
    create_table :exercises do |t|
      t.string :name
      t.integer :target
      t.boolean :double_weight

      t.timestamps
    end
  end
end
