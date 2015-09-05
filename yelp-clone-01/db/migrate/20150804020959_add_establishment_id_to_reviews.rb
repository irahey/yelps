class AddEstablishmentIdToReviews < ActiveRecord::Migration
  def change
    add_column :reviews, :establishment, :reference
  end
end
