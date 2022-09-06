class FeedbackEnabledBoolean < ActiveRecord::Migration[5.1]
  def up
    change_column :conferences, :feedback_enabled, :boolean, default: false
  end

  def down
    change_column :conferences, :feedback_enabled, :integer
  end
end
