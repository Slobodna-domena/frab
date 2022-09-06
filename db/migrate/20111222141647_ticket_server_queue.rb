class TicketServerQueue < ActiveRecord::Migration[5.1]
  def up
    add_column :ticket_servers, :queue, :string
  end

  def down
    remove_column :ticket_servers, :queue, :string
  end
end
