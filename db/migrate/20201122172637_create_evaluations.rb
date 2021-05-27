class CreateEvaluations < ActiveRecord::Migration[6.0]
  def change
    create_table :evaluations do |t|
      t.string :evaluator
      t.string :evaluatee
      t.integer :project
      t.integer :score
      t.string :comments

      t.timestamps
    end
  end
end
