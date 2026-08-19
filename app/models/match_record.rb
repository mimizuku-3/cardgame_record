class MatchRecord < ApplicationRecord
  belongs_to :my_deck, class_name: "Deck"
  belongs_to :opponent_deck, class_name: "Deck"

  enum :rock_paper_scissors_result, { win: "win", lose: "lose", free: "free" }, prefix: :rps
  enum :turn_order, { first: "first", second: "second" }, prefix: :turn
  enum :result, { win: "win", lose: "lose", both_lose: "both_lose" }, prefix: :match

  validates :played_on, presence: true
  validates :rock_paper_scissors_result, presence: true
  validates :turn_order, presence: true
  validates :result, presence: true
end
