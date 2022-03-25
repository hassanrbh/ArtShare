# frozen_string_literal: true

class AdduserIdtotracks < ActiveRecord::Migration[7.0]
  def change
    add_column :tracks, :user_id, :integer, nill: false
  end
end
