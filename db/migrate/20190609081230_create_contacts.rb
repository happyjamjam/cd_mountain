class CreateContacts < ActiveRecord::Migration[5.2]
  def change
    create_table :contacts do |t|
      t.integer :user_id
      t.text :contact_text
      t.text :reply_text

      t.timestamps
    end
  end
end
