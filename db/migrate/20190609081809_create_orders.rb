class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.integer :user_id
      t.string :shipping_status
      t.integer :total_price
      t.string :postal_code
      t.string :shipping_address
      t.string :shipping_name

      t.timestamps
    end
  end
end
