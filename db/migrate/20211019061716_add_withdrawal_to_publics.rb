class AddWithdrawalToPublics < ActiveRecord::Migration[5.0]
  def change
    add_column :publics, :withdrawal, :boolean, default: false
  end
end
