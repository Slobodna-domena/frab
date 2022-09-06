class AddParentToConference < ActiveRecord::Migration[5.1]
  def change
    add_reference :conferences, :parent, index: true
  end
end
