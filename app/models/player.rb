class Player < ApplicationRecord
  has_many :player_cards
  has_many :cards, through: :player_cards
  has_many :game_players
  has_many :games, through: :game_players
end
