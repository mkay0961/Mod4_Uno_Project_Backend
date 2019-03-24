class Card < ApplicationRecord
  belongs_to :deck, optional: true
  has_many :player_cards
end
