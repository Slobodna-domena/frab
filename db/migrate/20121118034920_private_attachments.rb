class PrivateAttachments < ActiveRecord::Migration[5.1]
  def up
    add_column :event_attachments, :public, :boolean, default: true
    EventAttachment.reset_column_information
    EventAttachment.all.each do |attachment|
      attachment.update_attribute :public, true
    end
  end

  def down
    remove_column :event_attachments, :public
  end
end
