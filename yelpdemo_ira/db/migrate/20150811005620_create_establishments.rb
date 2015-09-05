class CreateEstablishments < ActiveRecord::Migration
  def change
    create_table :establishments do |t|
      t.string :name
      t.string :street_address
      t.string :city
      t.string :province
      t.string :postal_code
      t.string :phone
      t.string :website
      t.string :image

      t.timestamps null: false
    end
  end
end
