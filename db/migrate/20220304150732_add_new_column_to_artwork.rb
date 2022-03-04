class AddNewColumnToArtwork < ActiveRecord::Migration[7.0]
  def change
    add_column :artworks, :favorites, :boolean, :default => false
    add_column :artwork_shares, :favorites, :boolean, :default => false
  end
end
