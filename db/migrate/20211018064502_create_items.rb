class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items do |t|
      t.integer :genre_id
      t.string :name
      t.string :image_id
      t.text :introduction
      t.integer :total_payment
      t.boolean :status

      t.timestamps
    end
  end
end
