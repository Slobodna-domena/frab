class RemoveCfpFromUser < ActiveRecord::Migration[5.1]
  def change
    remove_column :users, :call_for_papers_id
  end
end
