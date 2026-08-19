require "test_helper"

class MatchRecordsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @deck_one = decks(:one)
    @deck_two = decks(:two)
  end

  test "should get index" do
    get match_records_url
    assert_response :success
  end

  test "should get new" do
    get new_match_record_url
    assert_response :success
  end

  test "should create match_record with existing decks" do
    assert_difference("MatchRecord.count") do
      post match_records_url, params: {
        match_record: {
          played_on: Date.current,
          my_deck_id: @deck_one.id,
          opponent_deck_id: @deck_two.id,
          rock_paper_scissors_result: "win",
          turn_order: "first",
          result: "win"
        }
      }
    end

    assert_redirected_to match_records_path
  end

  test "should create match_record and new decks when deck names are given" do
    assert_difference("Deck.count", 2) do
      assert_difference("MatchRecord.count") do
        post match_records_url, params: {
          match_record: {
            played_on: Date.current,
            my_deck_name: "New My Deck",
            opponent_deck_name: "New Opponent Deck",
            rock_paper_scissors_result: "lose",
            turn_order: "second",
            result: "lose"
          }
        }
      end
    end

    match_record = MatchRecord.order(:id).last
    assert_equal "New My Deck", match_record.my_deck.name
    assert_equal "New Opponent Deck", match_record.opponent_deck.name
  end

  test "should not create match_record without required fields" do
    assert_no_difference("MatchRecord.count") do
      post match_records_url, params: { match_record: { played_on: nil } }
    end

    assert_response :unprocessable_entity
  end
end
