class CreateNotes < ActiveRecord::Migration[8.0]
  def change
    create_table :notes do |t|
      t.string :Notes_title
      t.text :Notes_description
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
