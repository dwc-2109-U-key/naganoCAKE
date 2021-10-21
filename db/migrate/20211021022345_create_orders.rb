class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :customer_id
      t.integer :status
      t.string :postal_code
      t.string :address
      t.string :name
      t.integer :postage
      t.integer :price
      t.integer :payment_method

      t.timestamps
    end
  end
end
