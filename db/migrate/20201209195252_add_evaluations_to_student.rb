class AddEvaluationsToStudent < ActiveRecord::Migration[6.0]
  def change
    add_reference :students, :evaluation
  end
end
