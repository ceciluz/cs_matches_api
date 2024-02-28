class PlayersController < ApplicationController
  before_action :set_player, only: [:update, :destroy, :show]

  def create
    @player = Player.new(player_params)
    if @player.save
      render json: @player, status: :created
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def update
    if @player.update(player_params)
      render json: @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @player.destroy
    head :no_content
  end

  def index
    players = Player.all
    render json: players.as_json(include: { team: { only: [:id, :name, :country, :region] }, performances: { only: [:kills, :deaths, :assists, :headshots] } }, except: [:team_id])
   end

  def show
    @player = Player.find(params[:id])
    render json: @player.as_json(include: { team: { only: [:id, :name, :country, :region] }, performances: { only: [:kills, :deaths, :assists, :headshots] } }, except: [:team_id])
  end

  def player_params
    params.require(:player).permit(:team_id, :name, :nickname, :nationality, :birth_date)
  end

  def set_player
    @player = Player.find(params[:id])
  end

end
