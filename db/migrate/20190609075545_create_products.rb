class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :product_name
      t.integer :label_id
      t.integer :price
      t.string :jacket_img_id
      t.integer :genre_id
      t.integer :stock
      t.string :sales_status

      t.timestamps
    end
  end
end
