class AddTelToOrders < ActiveRecord::Migration[5.2]
  def change
  	add_column :orders, :tel, :string
  end
end
