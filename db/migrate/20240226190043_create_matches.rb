class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.integer :team_home_score, null: false
      t.integer :team_away_score, null: false
      t.references :home_team, null: false, home_team: { to_table: :teams }, index: true
      t.references :away_team, null: false, home_team: { to_table: :teams }, index: true
      t.timestamps
    end
  end
end
