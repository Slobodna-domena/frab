class CreateVideos < ActiveRecord::Migration[5.1]
  def change
    create_table :videos do |t|
      t.references :event
      t.string :url
      t.string :mimetype

      t.timestamps
    end
    #add_index :videos, :event_id
  end
end
