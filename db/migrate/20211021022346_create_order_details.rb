class CreateOrderDetails < ActiveRecord::Migration[5.2]
  def change
    create_table :order_details do |t|
      t.integer :item_id
      t.integer :order_id
      t.integer :quantity
      t.integer :production_status
      t.integer :price

      t.timestamps
    end
  end
end
