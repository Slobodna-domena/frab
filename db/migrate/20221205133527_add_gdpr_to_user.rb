class AddGdprToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :gdpr, :boolean
  end
end
