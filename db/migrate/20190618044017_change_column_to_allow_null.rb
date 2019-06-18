class ChangeColumnToAllowNull < ActiveRecord::Migration[5.2]
  def up
    change_column :orders, :payment_method, :string, null: true # null: trueを明示する必要がある
  end

  def down
    change_column :orders, :payment_method, :string, null: false
  end
end
