class PlayerSerializer < ActiveModel::Serializer
  attributes :name
  # def cards
  #   self.object.cards.map{ |card|
  #     {
  #       "number": card.number,
  #       "color": card.color,
  #       "game_position": card.game_position
  #     }
  # end
end
