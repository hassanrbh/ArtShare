class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :user_id
      t.references :likeable, polymorphic: true
      t.timestamps
    end
    add_index :likes, [:user_id, :likeable_type, :likeable_id]
  end
end
