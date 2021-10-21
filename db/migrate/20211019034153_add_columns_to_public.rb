class AddColumnsToPublic < ActiveRecord::Migration[5.0]
  def change
    add_column :publics, :last_name, :string
    add_column :publics, :first_name, :string
    add_column :publics, :last_name_kana, :string
    add_column :publics, :first_name_kana, :string
    add_column :publics, :postal_code, :string
    add_column :publics, :address, :string
    add_column :publics, :telephone_number, :string
    add_column :publics, :withdrawal,  :boolean, default: false
  end
end