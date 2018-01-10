class AddDeckIdFoFlashcard < ActiveRecord::Migration[5.0]
  def change
    add_column :flashcards, :deck_id, :integer
    add_index :flashcards, :deck_id
  end
end
