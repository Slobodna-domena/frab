class RemoveVideosTable < ActiveRecord::Migration[5.1]
  def change
    drop_table :videos
  end
end
