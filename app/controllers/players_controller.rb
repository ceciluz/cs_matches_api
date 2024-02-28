class PlayersController < ApplicationController
  before_action :set_player, only: %i[update destroy show]

  def create
    @player = Player.new(player_params)
    if @player.save
      render @player, status: :created
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def update
    if @player.update(player_params)
      render @player
    else
      render json: @player.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @player.destroy
    head :no_content
  end

  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def player_params
    params.require(:player).permit(:team_id, :name, :nickname, :nationality, :birth_date)
  end

  def set_player
    @player = Player.find(params[:id])
  end
end
