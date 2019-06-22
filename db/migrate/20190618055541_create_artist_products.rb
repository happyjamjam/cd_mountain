class CreateArtistProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :artist_products do |t|
      t.references :artist, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
