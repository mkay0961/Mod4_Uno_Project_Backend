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
    puts "+++++++++++++++++++++++++"
    puts @game.id
    puts "+++++++++++++++++++++++++"
    @active = Card.find_by(number: params["active_card"]["Number"], color:params["active_card"]["Color"])
    @game.update(game_status: params["game_status"], winner: params["winner"], active_card_id: @active.id)


    Deck.where(game_id: @game.id).destroy_all
    params["deck"].each_with_index{|deck|
      g = Card.find_by(number:deck["Number"],color:deck["Color"])
      Deck.create(game_id: @game.id, card_id: g.id )
    }

    @game.players.each_with_index{|player, inx|

      PlayerCard.where( player_id: player.id).each{|card|
        # puts "+++++++++++++++++++++++++"puts
        puts card.destroy
        # puts player.id
        # x = PlayerCard.find_by(player_id: player.id,card_id: g.id)
        # puts "+++++++++++++++++++++++++"
      }

    }

    params["players"].each_with_index{|player, inx|
      p = Player.find_by(name: player["name"])
      player["cards"].each_with_index{|card,x|
        g = Card.find_by(number:card["Number"],color:card["Color"])
        l= PlayerCard.create(player_id: p.id,card_id: g.id)
       }
    }
    render json: @game
  end

  def create
    puts "KJGJHGJGJKVGV"
    game = Game.newGame(params["name"])
    render json: game

  end

end
