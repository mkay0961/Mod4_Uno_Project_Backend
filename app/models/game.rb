class Game < ApplicationRecord
  has_many :game_players
  has_many :players, through: :game_players
  has_many :cards

  def self.newGame(name)

    game1 = Game.create(game_status: "not started" , winner: "None")

    p1 = Player.find_or_create_by(name: name)
    p2 = Player.find_or_create_by(name: "Comp1")
    p3 = Player.find_or_create_by(name: "Comp2")
    p4 = Player.find_or_create_by(name: "Comp3")

    GamePlayer.create(game_id: game1.id, player_id: p1.id, seat: 0)
    GamePlayer.create(game_id: game1.id, player_id: p2.id, seat: 1)
    GamePlayer.create(game_id: game1.id, player_id: p3.id, seat: 2)
    GamePlayer.create(game_id: game1.id, player_id: p4.id, seat: 3)

    for x in (0..9)
      for i in ["red","yellow","green", "blue"]
        Card.create(number: x, color: i, game_id: game1.id)
      end
    end

    for x in (1..9)
      for i in ["red","yellow","green", "blue"]
        Card.create(number: x, color: i, game_id: game1.id)
      end
    end

    2.times do
      for x in ["draw2", "reverse", "skip"]
        for i in ["red","yellow","green", "blue"]
          Card.create(number: x, color: i, game_id: game1.id)
        end
      end

      for x in["color", "draw4"]
        for i in ["wild", "wild"]
             Card.create(number: x, color: i, game_id: game1.id)
        end
      end
    end


    return game1

  end
end
