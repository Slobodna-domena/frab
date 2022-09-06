class EventsArePublicByDefault < ActiveRecord::Migration[5.1]
  def change
    change_column :events, :public, :boolean, default: true
  end
end
