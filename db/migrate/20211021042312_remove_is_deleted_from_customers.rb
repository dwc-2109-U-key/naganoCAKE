class RemoveIsDeletedFromCustomers < ActiveRecord::Migration[5.0]
  def change
    remove_column :customers, :is_deleted, :boolean
  end
end
