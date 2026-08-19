FactoryBot.define do
  factory :match_record do
    played_on { Date.current }
    my_deck { association :deck }
    opponent_deck { association :deck }
    rock_paper_scissors_result { "win" }
    turn_order { "first" }
    result { "win" }
  end
end
