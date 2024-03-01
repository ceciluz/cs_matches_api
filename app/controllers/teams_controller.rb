# frozen_string_literal: true

class TeamsController < ApplicationController
  before_action :set_team, only: %i[update destroy show]

  def create
    @team = Team.new(team_params)
    if @team.save
      render @team, status: :created
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  def update
    if @team.update(team_params)
      render @team
    else
      render json: @team.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @team.destroy
    head :no_content
  end

  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  private

  def set_team
    @team = Team.find(params[:id])
  rescue StandardError => e
    render json: { error: e }, status: :not_found
  end

  def team_params
    params.require(:team).permit(:name, :country, :region)
  end
end
