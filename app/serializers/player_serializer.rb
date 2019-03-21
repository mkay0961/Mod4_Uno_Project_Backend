class PlayerSerializer < ActiveModel::Serializer
  attributes :name, :cards
  def cards
    self.object.cards.map{|card|
      obj = {}
      obj["Number"] = card.number
      obj["Color"] = card.color
      obj
     }
  end
end
