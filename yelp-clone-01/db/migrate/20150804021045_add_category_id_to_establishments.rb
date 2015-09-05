class AddCategoryIdToEstablishments < ActiveRecord::Migration
  def change
    add_column :establishments, :category, :reference
  end
end
