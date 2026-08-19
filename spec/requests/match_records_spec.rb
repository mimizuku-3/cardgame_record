require "rails_helper"

RSpec.describe "MatchRecords", type: :request do
  let(:deck_one) { create(:deck) }
  let(:deck_two) { create(:deck) }

  describe "GET /match_records" do
    it "returns success" do
      get match_records_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /match_records/new" do
    it "returns success" do
      get new_match_record_path
      expect(response).to have_http_status(:success)
    end
  end

  describe "POST /match_records" do
    it "creates a match record with existing decks" do
      expect {
        post match_records_path, params: {
          match_record: {
            played_on: Date.current,
            my_deck_id: deck_one.id,
            opponent_deck_id: deck_two.id,
            rock_paper_scissors_result: "win",
            turn_order: "first",
            result: "win"
          }
        }
      }.to change(MatchRecord, :count).by(1)

      expect(response).to redirect_to(match_records_path)
    end

    it "creates a match record and new decks when deck names are given" do
      expect {
        expect {
          post match_records_path, params: {
            match_record: {
              played_on: Date.current,
              my_deck_name: "新しい使用デッキ",
              opponent_deck_name: "新しい相手デッキ",
              rock_paper_scissors_result: "lose",
              turn_order: "second",
              result: "lose"
            }
          }
        }.to change(Deck, :count).by(2)
      }.to change(MatchRecord, :count).by(1)

      match_record = MatchRecord.order(:id).last
      expect(match_record.my_deck.name).to eq("新しい使用デッキ")
      expect(match_record.opponent_deck.name).to eq("新しい相手デッキ")
    end

    it "does not create a match record without required fields" do
      expect {
        post match_records_path, params: { match_record: { played_on: nil } }
      }.not_to change(MatchRecord, :count)

      expect(response).to have_http_status(:unprocessable_content)
    end
  end
end
