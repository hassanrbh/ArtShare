class CreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :comments do |t|
      t.integer :author_id, :null => false
      t.integer :post_id, :null => false
      t.text :body, :null => false

      t.timestamps
    end
    add_index :comments, [:author_id, :post_id]
  end
end
