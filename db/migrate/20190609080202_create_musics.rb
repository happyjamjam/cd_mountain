class CreateMusics < ActiveRecord::Migration[5.2]
  def change
    create_table :musics do |t|
      t.string :music_title
      t.integer :disk_id
      t.integer :artist_id
      t.string :track_number

      t.timestamps
    end
  end
end
