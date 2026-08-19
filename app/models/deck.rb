class Deck < ApplicationRecord
  has_many :match_records_as_my_deck, class_name: "MatchRecord", foreign_key: :my_deck_id, inverse_of: :my_deck
  has_many :match_records_as_opponent_deck, class_name: "MatchRecord", foreign_key: :opponent_deck_id, inverse_of: :opponent_deck

  validates :name, presence: true, uniqueness: true
end
