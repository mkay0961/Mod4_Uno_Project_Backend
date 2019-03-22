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
    @active = Card.find_by(number: params["active_card"]["Number"], color:params["active_card"]["Color"])
    @game.update(game_status: params["game_status"], winner: params["winner"], active_card_id: @active.id)
    byebug
#     @deck = @game.deck
#
#
#
#     puts @deck
#     puts"sd.kjfhasdkjfh"
#     @deck.each_with_index{|deck, inx|
#                 card = Card.find(deck.card_id)
#                 card.update(number:params["deck"][inx]["Number"], color:params["deck"][inx]["Color"])
#                           }
#
# puts @deck
#     # @players = @game.players
#
#
#
#
#     # @players.each_with_index{|player, x|
#     #               # puts "++++++++_+"
#     #               # puts player.name
#     #               player.cards.each_with_index{|card,inx|
#     #                         card.update(number:params["players"][x]["cards"][inx]["Number"],
#     #                                     color:params["players"][x]["cards"][inx]["Color"])
#     #                         # puts params["players"][x]["cards"][inx]
#     #                         # # puts params["players"][x]["cards"][inx]
#     #                         # puts "++++++++_+"
#     #                         }}
#     byebug
#     puts @players
#     puts @game
    render json: @game
    # puts params["deck"]
    # puts params["players"]

  end

end
