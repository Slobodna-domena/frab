class AddEmailToConference < ActiveRecord::Migration[5.1]
  def self.up
    add_column :conferences, :email, :string
  end

  def self.down
    remove_column :conferences, :email
  end
end
