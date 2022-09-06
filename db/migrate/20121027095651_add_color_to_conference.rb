class AddColorToConference < ActiveRecord::Migration[5.1]
  def change
    add_column :conferences, :color, :string
  end
end
