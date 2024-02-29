json.id @team.id
  json.extract! @team, :id, :name, :country, :region
  json.players @team.players do |player|
    json.extract! player, :id, :name, :nickname, :nationality, :birth_date, :age
  end
  json.matches_as_home @team.matches_as_home_team do |match|
    json.win match.win?
    json.score match.team_home_score
    json.opponent_score match.team_away_score
    json.opponent_name match.team_away.name
    json.opponent_id match.team_away_id
  end

  json.matches_as_away @team.matches_as_home_team do |match|
    json.win match.win?
    json.score match.team_home_score
    json.opponent_score match.team_away_score
    json.opponent_name match.team_away.name
    json.opponent_id match.team_away_id
  end

