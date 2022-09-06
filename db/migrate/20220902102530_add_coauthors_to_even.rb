class AddCoauthorsToEven < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :coauthors, :text
  end
end
