class AddBccAddressToConferences < ActiveRecord::Migration[5.1]
  def change
    add_column :conferences, :bcc_address, :string, limit: 255
  end
end
