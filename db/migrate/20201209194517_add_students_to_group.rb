class AddStudentsToGroup < ActiveRecord::Migration[6.0]
  def change
    add_reference(:groups, :student)
  end
end
