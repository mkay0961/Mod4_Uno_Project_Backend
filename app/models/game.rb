class Game < ApplicationRecord
  has_many :game_players
  has_many :players, through: :game_players
  has_many :cards

  def self.newGame(name)
    game1 = Game.create(game_status: "not started" , winner: "None")

    p1 = Player.create(name: name)
    p2 = Player.create(name: "Comp1")
    p3 = Player.create(name: "Comp2")
    p4 = Player.create(name: "Comp3")

    GamePlayer.create(game_id: game1.id, player_id: p1.id)
    GamePlayer.create(game_id: game1.id, player_id: p2.id)
    GamePlayer.create(game_id: game1.id, player_id: p3.id)
    GamePlayer.create(game_id: game1.id, player_id: p4.id)


    allcards = Card.all
    allcards= allcards.shuffle
    allcards= allcards.shuffle

      for g in game1.players
        for i in (0..4)
          card = allcards.shift()
          PlayerCard.create(player_id: g.id,card_id: card.id)
        end
        puts "---"
      end
      puts "---"
      puts allcards.count
      puts "---"

      game1.update(active_card_id: allcards.shift().id)

      for k in allcards
        Deck.create(game_id: game1.id, card_id: k.id )
      end

    return game1

  end
end
