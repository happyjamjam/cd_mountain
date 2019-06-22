class RemoveArtistIdFromMusics < ActiveRecord::Migration[5.2]
  def change
    remove_column :musics, :artist_id, :integer
  end
end
