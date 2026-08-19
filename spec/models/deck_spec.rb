require "rails_helper"

RSpec.describe Deck, type: :model do
  it "is valid with a name" do
    deck = build(:deck)
    expect(deck).to be_valid
  end

  it "is invalid without a name" do
    deck = build(:deck, name: nil)
    expect(deck).not_to be_valid
  end

  it "is invalid with a duplicate name" do
    existing = create(:deck)
    deck = build(:deck, name: existing.name)
    expect(deck).not_to be_valid
  end
end
