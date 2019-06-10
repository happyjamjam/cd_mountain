class RemoveColumnsFromUsers < ActiveRecord::Migration[5.2]
  def change
    remove_column :users, :first_name, :string
    remove_column :users, :last_name, :string
    remove_column :users, :kana_first_name, :string
    remove_column :users, :kana_last_name, :string
    remove_column :users, :postal_code, :string
    remove_column :users, :address, :string
    remove_column :users, :tel, :string
  end
end
