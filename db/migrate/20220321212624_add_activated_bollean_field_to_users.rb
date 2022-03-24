# frozen_string_literal: true

class AddActivatedBolleanFieldToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :activated, :boolean, default: false
  end
end
