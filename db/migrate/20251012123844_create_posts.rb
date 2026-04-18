class CreatePosts < ActiveRecord::Migration[8.0]
  def change
    create_table :posts do |t|
      t.string :post_title
      t.string :images
      t.string :video_url
      t.references :topic, null: false, foreign_key: true

      t.timestamps
    end
  end
end
