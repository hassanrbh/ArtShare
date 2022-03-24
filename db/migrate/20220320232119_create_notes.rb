# frozen_string_literal: true

class CreateNotes < ActiveRecord::Migration[7.0]
  def change
    create_table :notes do |t|
      t.text :longnote, null: false
      t.integer :user_id, null: false
      t.integer :track_id, null: false

      t.timestamps
    end
  end
end
