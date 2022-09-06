class AddTechRiderToEvent < ActiveRecord::Migration[5.1]
  def change
    add_column :events, :tech_rider, :text
  end
end
