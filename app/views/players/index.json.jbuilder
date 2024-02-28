json.array! @players do |player|

  json.extract! player, :team_id, :name, :nickname, :nationality, :birth_date, :age
  json.age player.age

  json.team do
    json.extract! player.team, :id, :name, :country, :region
  end

  json.player_performances @player.player_performances do |player_performance|
    json.extract! player_performance, :kills, :deaths, :assists, :headshots
  end
end
