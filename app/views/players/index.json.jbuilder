# frozen_string_literal: true

json.array! @players do |player|
  json.extract! player, :id, :name, :nickname, :nationality, :birth_date, :age
  json.age player.age

  json.team do
    json.extract! player.team, :id, :name, :country, :region
  end

  json.player_performances player.player_performances do |player_performance|
    json.extract! player_performance, :kills, :deaths, :assists, :headshots
    json.match player_performance.match.match_name
    json.win? player_performance.match.win?
    json.team_score player_performance.match.team_home_score
    json.team_score player_performance.match.team_home_score
    json.opponent_score player_performance.match.team_away_score
  end
end
