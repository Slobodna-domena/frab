class IncreaseVersionObjectChangesSize < ActiveRecord::Migration[5.1]
  def up
    change_column :versions, :object_changes, :text, limit: 4.megabytes
  end

  def down
    change_column :versions, :object_changes, :text
  end
end
