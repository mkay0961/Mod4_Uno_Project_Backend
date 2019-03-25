class PlayerSerializer < ActiveModel::Serializer
  attributes :name, :cards
  def cards
    self.object.cards.map{|card|
      obj = {}
      obj["number"] = card.number
      obj["color"] = card.color
      obj
     }
  end
end
