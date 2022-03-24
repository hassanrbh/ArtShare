# frozen_string_literal: true

class CreateTags < ActiveRecord::Migration[7.0]
  def change
    create_table :tags do |t|
      t.string :tag, null: false
      t.references :tageable, polymorphic: true
      t.timestamps
    end
    add_index :tags, %i[tageable_type tageable_id]
  end
end
