class AddUserIdToSongquestions < ActiveRecord::Migration[6.1]
  def change
    add_column :songquestions, :user_id, :integer
  end
end
