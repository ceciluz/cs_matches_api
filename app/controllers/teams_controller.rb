class TeamsController < ApplicationController
  before_action :set_team, only: [:update, :destroy, :show]

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
    @teams = Teams.all
  end

  def show
    @team = Teams.find(params[:id])
  end

  private

  def set_team
    @team = Team.find(params[:id])
  end

  def team_params
    params.require(:team).permit(:name, :country, :region)
  end
end
