class AddCoauthorToEvent < ActiveRecord::Migration[6.1]
  def change
    add_column :events, :coauthor_1_name, :string
    add_column :events, :coauthor_1_last_name, :string

    add_column :events, :coauthor_2_name, :string
    add_column :events, :coauthor_2_last_name, :string

    add_column :events, :coauthor_3_name, :string
    add_column :events, :coauthor_3_last_name, :string

    add_column :events, :coauthor_4_name, :string
    add_column :events, :coauthor_4_last_name, :string

    add_column :events, :coauthor_5_name, :string
    add_column :events, :coauthor_5_last_name, :string

  end
end
