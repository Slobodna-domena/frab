class AddConfirmationTokenToEventPeople < ActiveRecord::Migration[5.1]
  def self.up
    add_column :event_people, :confirmation_token, :string
  end

  def self.down
    remove_column :event_people, :confirmation_token
  end
end
