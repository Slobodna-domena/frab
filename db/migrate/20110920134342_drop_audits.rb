class DropAudits < ActiveRecord::Migration[5.1]
  def change
    drop_table :audits
  end
end
