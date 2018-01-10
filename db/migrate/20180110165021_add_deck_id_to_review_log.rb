class AddDeckIdToReviewLog < ActiveRecord::Migration[5.0]
  def change
    add_column :review_logs, :deck_id, :integer
    add_index :review_logs, :deck_id
  end
end
