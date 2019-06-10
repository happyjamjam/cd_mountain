class AddColumnsToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :kana_first_name, :string
    add_column :users, :kana_last_name, :string
    add_column :users, :postal_code, :string
    add_column :users, :address, :string
    add_column :users, :tel, :string
  end
end
