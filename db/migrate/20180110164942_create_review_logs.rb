class CreateReviewLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :review_logs do |t|
      t.integer :score
      t.date :date

      t.timestamps
    end
  end
end
