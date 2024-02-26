class CreateMatches < ActiveRecord::Migration[6.1]
  def change
    create_table :matches do |t|
      t.integer :team_home_score
      t.integer :team_away_score
      t.belongs_to :team_home, null: false, foreign_key: true
      t.belongs_to :team_away, null: false, foreign_key: true

      t.timestamps
    end
  end
end
