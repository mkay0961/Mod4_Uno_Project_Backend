# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Game.destroy_all
Player.destroy_all
Card.destroy_all


game1 = Game.create(game_status: "not started" , winner: "None")
p1 = Player.create(name: "Phil")
p2 = Player.create(name: "Matt")
GamePlayer.create(game_id: game1.id, player_id: p1.id)
GamePlayer.create(game_id: game1.id, player_id: p2.id)
for x in (0..10)
  for i in ["red","yellow","green", "blue"]
    Card.create(number: x, color: i)
  end
end
Card.all[5].update(player_id: p1.id)
Card.all[15].update(player_id: p1.id)
Card.all[20].update(player_id: p1.id)
Card.all[25].update(player_id: p1.id)

deck1 = Deck.create(game_id: game1.id, card_id: Card.all[17].id )
deck2 = Deck.create(game_id: game1.id, card_id: Card.all[18].id )

Game.first.update(active_card_id: Card.all[24].id)
