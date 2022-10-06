class AddPeerToEventRating < ActiveRecord::Migration[6.1]
  def change
    add_column :event_ratings, :peer, :boolean, default: false
  end
end
