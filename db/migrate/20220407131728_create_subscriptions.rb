class CreateSubscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :subscriptions do |t|
      t.integer :user_id, :null => false
      t.boolean :subscription , :default => false
      t.string :subscription_type, :default => "basic", null: false 
      t.timestamps
    end
    add_index :subscriptions, :user_id
  end
end
