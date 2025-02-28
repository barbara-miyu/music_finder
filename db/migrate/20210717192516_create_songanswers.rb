class CreateSonganswers < ActiveRecord::Migration[6.1]
  def change
    create_table :songanswers do |t|
      t.text :content
      t.references :user, null: false, foreign_key: true
      t.references :songquestion, null: false, foreign_key: true

      t.timestamps
    end
  end
end
