class CreatePlayers < ActiveRecord::Migration[6.1]
  def change
    create_table :players do |t|
      t.string :name, null:false
      t.string :nickname, null:false
      t.string :nationality, null:false
      t.date :birth_date, null:false
      t.references :team, index:true, null:false

      t.timestamps
    end
  end
end
