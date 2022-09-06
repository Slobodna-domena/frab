class AddUserToPerson < ActiveRecord::Migration[5.1]
  def self.up
    add_column :people, :user_id, :integer
  end

  def self.down
    remove_column :people, :user_id
  end
end
