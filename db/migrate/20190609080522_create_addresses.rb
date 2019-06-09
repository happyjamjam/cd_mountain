class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.string :postal_code
      t.string :tel

      t.timestamps
    end
  end
end
