require "test_helper"

class MatchRecordTest < ActiveSupport::TestCase
  def valid_attributes
    {
      played_on: Date.current,
      my_deck: decks(:one),
      opponent_deck: decks(:two),
      rock_paper_scissors_result: :win,
      turn_order: :first,
      result: :win
    }
  end

  test "valid with all required attributes" do
    match_record = MatchRecord.new(valid_attributes)
    assert match_record.valid?
  end

  test "invalid without played_on" do
    match_record = MatchRecord.new(valid_attributes.merge(played_on: nil))
    assert_not match_record.valid?
  end

  test "invalid without my_deck" do
    match_record = MatchRecord.new(valid_attributes.merge(my_deck: nil))
    assert_not match_record.valid?
  end

  test "invalid without opponent_deck" do
    match_record = MatchRecord.new(valid_attributes.merge(opponent_deck: nil))
    assert_not match_record.valid?
  end

  test "invalid without rock_paper_scissors_result" do
    match_record = MatchRecord.new(valid_attributes.merge(rock_paper_scissors_result: nil))
    assert_not match_record.valid?
  end

  test "invalid without turn_order" do
    match_record = MatchRecord.new(valid_attributes.merge(turn_order: nil))
    assert_not match_record.valid?
  end

  test "invalid without result" do
    match_record = MatchRecord.new(valid_attributes.merge(result: nil))
    assert_not match_record.valid?
  end

  test "defaults include_in_aggregation to true" do
    match_record = MatchRecord.create!(valid_attributes)
    assert match_record.include_in_aggregation?
  end
end
