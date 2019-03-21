class Card < ApplicationRecord
  belongs_to :player, optional: true
  belongs_to :deck, optional: true
end
