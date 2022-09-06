class AddCustomScheduleCssToConference < ActiveRecord::Migration[5.1]
  def change
    add_column :conferences, :schedule_custom_css, :text, limit: 2.megabytes
  end
end
