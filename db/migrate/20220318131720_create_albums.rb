# frozen_string_literal: true

class CreateAlbums < ActiveRecord::Migration[7.0]
  def change
    create_table :albums do |t|
      t.string :name, null: false
      t.integer :band_id, null: false
      t.string :live, null: false, default: 'f', limit: 1
      t.integer :year, null: false
      t.timestamps
    end
    add_index :albums, :band_id
  end
end
