# frozen_string_literal: true

class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.integer :team_home_score, null: false
      t.integer :team_away_score, null: false
      t.references :team_home, null: false, foreign_key: { to_table: :teams}
      t.references :team_away, null: false, foreign_key: { to_table: :teams}
      t.timestamps
    end
  end
end
