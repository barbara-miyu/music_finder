class CreateSongs < ActiveRecord::Migration[6.1]
  def change
    create_table :songs do |t|
      t.string :title
      t.string :artist
      t.text :content
      t.integer :song_id

      t.timestamps
    end
  end
end
