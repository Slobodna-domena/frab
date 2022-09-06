class AddScheduleVersionToConferences < ActiveRecord::Migration[5.1]
  def self.up
    add_column :conferences, :schedule_version, :string, default: nil
  end

  def self.down
    remove_column :conferences, :schedule_version
  end
end
