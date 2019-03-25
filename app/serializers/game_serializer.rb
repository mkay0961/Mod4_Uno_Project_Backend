class GameSerializer < ActiveModel::Serializer
  attributes :id, :game_status, :winner, :active_card, :deck
  has_many :players

  def active_card
    card = Card.find(self.object.active_card_id)

    {
     number: card.number,
     color: card.color
    }

  end

  def deck
    self.object.deck.map{|card|
      card = Card.find(card.card_id)
      obj = {}
      obj["number"] = card.number
      obj["color"] = card.color
      obj
    }
  end

end
