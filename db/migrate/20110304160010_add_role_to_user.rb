class AddRoleToUser < ActiveRecord::Migration[5.1]
  def self.up
    add_column :users, :role, :string, default: "submitter"
  end

  def self.down
    remove_column :users, :role
  end
end
