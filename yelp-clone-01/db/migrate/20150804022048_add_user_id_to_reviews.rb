class AddUserIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :user, :reference
  end
end
