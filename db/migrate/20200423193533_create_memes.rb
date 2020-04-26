class CreateMemes < ActiveRecord::Migration[6.0]
  def change
    create_table :memes do |t|
      t.integer :user_id
      t.string :meme_name
      t.string :img_url
      t.string :top_text
      t.string :bottom_text

      t.timestamps
    end
  end
end
