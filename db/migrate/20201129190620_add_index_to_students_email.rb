class AddIndexToStudentsEmail < ActiveRecord::Migration[6.0]
  def change
    add_index :students, :email, unique: true
  end
end
