class AddIndexToArtwork < ActiveRecord::Migration[7.0]
  def change
    add_index :artworks, :artist_id
  end
end
