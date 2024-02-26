class CreateTeams < ActiveRecord::Migration[6.1]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :country
      t.string :region

      t.timestamps
    end
  end
end
