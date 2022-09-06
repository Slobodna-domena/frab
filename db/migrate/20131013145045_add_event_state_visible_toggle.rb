class AddEventStateVisibleToggle < ActiveRecord::Migration[5.1]
  def change
    add_column :conferences, :event_state_visible, :boolean, default: true
  end
end
