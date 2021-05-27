class AddStudentGroupToEvaluations < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :evaluations, :student
    add_belongs_to :evaluations, :group
  end
end
