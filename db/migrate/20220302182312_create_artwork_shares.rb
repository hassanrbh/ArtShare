class CreateArtworkShares < ActiveRecord::Migration[7.0]
  def change
    create_table :artwork_shares do |t|
      t.integer :artwork_id, :null => false
      t.integer :viewer_id, :null => false

      t.timestamps
    end
  end
end
