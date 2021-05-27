class AddGroupToStudent < ActiveRecord::Migration[6.0]
  def change
    add_belongs_to :students, :group
  end
end
