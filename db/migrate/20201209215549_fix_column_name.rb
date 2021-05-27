class FixColumnName < ActiveRecord::Migration[6.0]
  def change
    rename_column :students, :team, :group_name
  end
end
