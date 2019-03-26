class CardSerializer < ActiveModel::Serializer
  attributes :number, :color, :game_position
end
