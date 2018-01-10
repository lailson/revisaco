class CreateFlashcards < ActiveRecord::Migration[5.0]
  def change
    create_table :flashcards do |t|
      t.text :front
      t.text :back
      t.datetime :due
      t.integer :interval
      t.decimal :ease_factor
      t.datetime :last_review

      t.timestamps
    end
  end
end
