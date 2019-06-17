class AddDefaultToShippingStatus < ActiveRecord::Migration[5.2]
  def up
  	change_column :orders, :shipping_status, :string, default: "発送準備中"
  end

  def down
  	change_column :orders, :shipping_status, :string
  end
end
