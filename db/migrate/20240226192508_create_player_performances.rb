class CreatePlayerPerformances < ActiveRecord::Migration[6.1]
  def change
    create_table :player_performances do |t|
      t.integer :kills
      t.integer :assists
      t.integer :deaths
      t.integer :headshots
      t.belongs_to :player, null: false, foreign_key: true
      t.belongs_to :match, null: false, foreign_key: true

      t.timestamps
    end
  end
end
