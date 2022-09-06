class CreateTrackNameTranslationsForMobilityTableBackend < ActiveRecord::Migration[5.1]
  def change
    create_table :track_translations do |t|

      # Translated attribute(s)
      t.string :name

      t.string  :locale, null: false
      t.references :track, null: false, foreign_key: true, index: false

      t.timestamps null: false
    end

    add_index :track_translations, :locale, name: :index_track_translations_on_locale
    add_index :track_translations, [:track_id, :locale], name: :index_track_translations_on_track_id_and_locale, unique: true

  end
end
