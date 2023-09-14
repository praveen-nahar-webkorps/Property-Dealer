class CreateBuys < ActiveRecord::Migration[7.0]
  def change
    create_table :buys do |t|
      t.string :about
      t.string :add
      t.integer :price
      t.integer :phone_no
      t.string :property_type
      t.string :landmark

      t.timestamps
    end
  end
end
