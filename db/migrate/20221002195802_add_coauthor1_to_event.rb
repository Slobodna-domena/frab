class AddCoauthor1ToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :coauthor_1, :string
    add_column :events, :coauthor_2, :string
    add_column :events, :coauthor_3, :string
    add_column :events, :coauthor_4, :string
    add_column :events, :coauthor_5, :string
  end
end
