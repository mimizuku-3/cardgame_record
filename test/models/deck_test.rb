require "test_helper"

class DeckTest < ActiveSupport::TestCase
  test "valid with a name" do
    deck = Deck.new(name: "New Deck")
    assert deck.valid?
  end

  test "invalid without a name" do
    deck = Deck.new(name: nil)
    assert_not deck.valid?
  end

  test "invalid with a duplicate name" do
    deck = Deck.new(name: decks(:one).name)
    assert_not deck.valid?
  end
end
