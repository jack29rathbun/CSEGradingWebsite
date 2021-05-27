class AddEvaluationsToGroup < ActiveRecord::Migration[6.0]
  def change
    add_reference :groups, :evaluation
  end
end
