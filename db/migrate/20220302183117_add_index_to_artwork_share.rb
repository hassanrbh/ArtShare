class AddIndexToArtworkShare < ActiveRecord::Migration[7.0]
  def change
    add_index :artwork_shares, [:viewer_id, :artwork_id]
  end
end
