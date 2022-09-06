class CreateMailTemplates < ActiveRecord::Migration[5.1]
  def change
    create_table :mail_templates do |t|
      t.references :conference
      t.string :name
      t.string :subject
      t.text :content

      t.timestamps
    end
    #add_index :mail_templates, :conference_id
  end
end
