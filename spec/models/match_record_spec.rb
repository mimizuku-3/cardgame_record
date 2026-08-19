require "rails_helper"

RSpec.describe MatchRecord, type: :model do
  it "is valid with all required attributes" do
    match_record = build(:match_record)
    expect(match_record).to be_valid
  end

  it "is invalid without played_on" do
    match_record = build(:match_record, played_on: nil)
    expect(match_record).not_to be_valid
  end

  it "is invalid without my_deck" do
    match_record = build(:match_record, my_deck: nil)
    expect(match_record).not_to be_valid
  end

  it "is invalid without opponent_deck" do
    match_record = build(:match_record, opponent_deck: nil)
    expect(match_record).not_to be_valid
  end

  it "is invalid without rock_paper_scissors_result" do
    match_record = build(:match_record, rock_paper_scissors_result: nil)
    expect(match_record).not_to be_valid
  end

  it "is invalid without turn_order" do
    match_record = build(:match_record, turn_order: nil)
    expect(match_record).not_to be_valid
  end

  it "is invalid without result" do
    match_record = build(:match_record, result: nil)
    expect(match_record).not_to be_valid
  end

  it "defaults include_in_aggregation to true" do
    match_record = create(:match_record)
    expect(match_record.include_in_aggregation?).to be(true)
  end
end
