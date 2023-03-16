class AddMailSentToConference < ActiveRecord::Migration[6.1]
  def change
    add_column :conferences, :mail_sent, :integer, array: true, default: []
  end
end
