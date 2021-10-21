class RemoveWithdrawalStatusFromCustomers < ActiveRecord::Migration[5.0]
  def change
    remove_column :customers, :withdrawal_status, :integer
  end
end
