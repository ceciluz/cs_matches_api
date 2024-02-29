# frozen_string_literal: true

json.extract! match, :team_home_id, :team_away_id, :team_home_score, :team_away_score

json.player_performances_attributes match.player_performances do |player_performance|
  json.extract! player_performance, :player_id, :kills, :deaths, :assists, :headshots
end
