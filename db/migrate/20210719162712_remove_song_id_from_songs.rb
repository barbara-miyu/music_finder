class RemoveSongIdFromSongs < ActiveRecord::Migration[6.1]
  def change
    remove_column :songs, :song_id, :integer
  end
end
