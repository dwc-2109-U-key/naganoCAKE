class RemoveWithdrawalFromPublics < ActiveRecord::Migration[5.0]
  def change
    remove_column :publics, :withdrawal, :boolean
  end
end
