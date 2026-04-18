class RenameNotesColumns < ActiveRecord::Migration[8.0]
  def change
    rename_column :notes, :Notes_title, :note_title
    rename_column :notes, :Notes_description, :note_description
  end
end
