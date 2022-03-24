# frozen_string_literal: true

class AddActivationTokenToUsers < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :activation_token, :text
  end
end
