class Card < ApplicationRecord
  belongs_to :player, optional: true
end
