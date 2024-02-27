# frozen_string_literal: true

class CreatePlayerPerformances < ActiveRecord::Migration[6.1]
  def change
    create_table :player_performances do |t|
      t.integer :kills, null: false
      t.integer :assists, null: false
      t.integer :deaths, null: false
      t.integer :headshots, null: false
      t.references :match, null: false, index: true
      t.references :player, null: false, index: true

      t.timestamps
    end
  end
end
