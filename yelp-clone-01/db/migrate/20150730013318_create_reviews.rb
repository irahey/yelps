class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.integer :rating
      t.text :review_content
      t.datetime :date_time

      t.timestamps null: false
    end
  end
end
