class MatchesController < ApplicationController
  def create
    @match = Match.new(match_params)
    if @match.save
      render json: @match, status: :created
    else
      render json: @match.errors, status: :unprocessable_entity
    end
  end

  private
  def match_params
    params.require(:match).permit(:team_home_score, :team_away_score, :team_home_id, :team_away_id, player_performances_attributes: [:player_id, :kills, :assists, :deaths, :headshots])
  end
end
