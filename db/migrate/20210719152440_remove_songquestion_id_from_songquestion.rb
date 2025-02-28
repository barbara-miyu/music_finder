class RemoveSongquestionIdFromSongquestion < ActiveRecord::Migration[6.1]
  def change
    remove_column :songquestions, :songquestion_id, :integer
  end
end
