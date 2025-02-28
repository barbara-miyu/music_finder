class CreateSongquestions < ActiveRecord::Migration[6.1]
  def change
    create_table :songquestions do |t|
      t.text :content
      t.integer :songquestion_id

      t.timestamps
    end
  end
end
