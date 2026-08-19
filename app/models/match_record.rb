class MatchRecord < ApplicationRecord
  belongs_to :my_deck, class_name: "Deck"
  belongs_to :opponent_deck, class_name: "Deck"

  enum :rock_paper_scissors_result, { win: "win", lose: "lose", free: "free" }, prefix: :rps
  enum :turn_order, { first: "first", second: "second" }, prefix: :turn
  enum :result, { win: "win", lose: "lose", both_lose: "both_lose" }, prefix: :match

  ROCK_PAPER_SCISSORS_RESULT_LABELS = { "win" => "勝ち", "lose" => "負け", "free" => "自由" }.freeze
  TURN_ORDER_LABELS = { "first" => "先攻", "second" => "後攻" }.freeze
  RESULT_LABELS = { "win" => "勝ち", "lose" => "負け", "both_lose" => "両負け" }.freeze
  INCLUDE_IN_AGGREGATION_LABELS = { true => "含める", false => "含めない" }.freeze

  validates :played_on, presence: true
  validates :rock_paper_scissors_result, presence: true
  validates :turn_order, presence: true
  validates :result, presence: true

  def rock_paper_scissors_result_label
    ROCK_PAPER_SCISSORS_RESULT_LABELS[rock_paper_scissors_result]
  end

  def turn_order_label
    TURN_ORDER_LABELS[turn_order]
  end

  def result_label
    RESULT_LABELS[result]
  end

  def include_in_aggregation_label
    INCLUDE_IN_AGGREGATION_LABELS[include_in_aggregation]
  end
end
