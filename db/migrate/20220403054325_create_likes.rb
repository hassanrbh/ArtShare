class CreateLikes < ActiveRecord::Migration[7.0]
  def change
    create_table :likes do |t|
      t.integer :user_id, :null => false
      t.integer :note_id, :null => false
      t.timestamps
    end
    add_index :likes, [:user_id, :note_id], :unique => true
  end
end
