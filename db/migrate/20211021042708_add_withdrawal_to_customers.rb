class AddWithdrawalToCustomers < ActiveRecord::Migration[5.0]
  def change
    add_column :customers, :withdrawal, :boolean
  end
end
