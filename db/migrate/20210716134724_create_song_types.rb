class CreateSongTypes < ActiveRecord::Migration[6.1]
  def change
    create_table :song_types do |t|
      t.references :song, null: false, foreign_key: true
      t.references :type, null: false, foreign_key: true

      t.timestamps
    end
  end
end
