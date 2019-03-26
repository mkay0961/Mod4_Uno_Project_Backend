class GamesController < ApplicationController

  def index
    @games = Game.all
    render json: @games
  end

  def show
    @game = Game.find(params[:id])
    render json: @game
  end

  def update
    @game = Game.find(params[:id])
    @game.update(game_status: params["game_status"], winner:params["winner"])
    @game.cards.each_with_index{|card,x|
      puts"++"
      puts params["cards"][x]
      puts card.number
      puts "+++"
      newPos = params["cards"][x]["game_position"]
      card.update(game_position: newPos )
    }
    render json: @game
  end

  def destroy
    @game = Game.find(params[:id])
    @game.destroy
    render json: Game.all
  end

  def create
    game = Game.newGame(params["name"])
    render json: game

  end

end
