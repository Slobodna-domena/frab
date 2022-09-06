class AddAttachmentLogoToConferences < ActiveRecord::Migration[5.1]
  def self.up
    change_table :conferences do |t|
      t.attachment :logo
    end
  end

  def self.down
    remove_attachment :conferences, :logo
  end
end
