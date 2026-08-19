class MatchRecordsController < ApplicationController
  def index
    @match_records = MatchRecord.includes(:my_deck, :opponent_deck).order(played_on: :desc, id: :desc)
  end

  def show
    @match_record = MatchRecord.includes(:my_deck, :opponent_deck).find(params[:id])
  end

  def new
    @match_record = MatchRecord.new
    @decks = Deck.order(:name)
  end

  def create
    @match_record = MatchRecord.new(match_record_params)
    assign_deck(:my_deck)
    assign_deck(:opponent_deck)

    if @match_record.save
      redirect_to match_records_path, notice: "戦績を登録しました。"
    else
      @decks = Deck.order(:name)
      render :new, status: :unprocessable_content
    end
  end

  private

  def match_record_params
    params.require(:match_record).permit(
      :played_on, :tournament_name, :opponent_name,
      :rock_paper_scissors_result, :turn_order, :result,
      :environment, :include_in_aggregation, :memo
    )
  end

  def assign_deck(association)
    deck_name = params[:match_record]["#{association}_name"]
    deck_id = params[:match_record]["#{association}_id"]

    if deck_name.present?
      @match_record.public_send("#{association}=", Deck.find_or_create_by(name: deck_name))
    elsif deck_id.present?
      @match_record.public_send("#{association}=", Deck.find_by(id: deck_id))
    end
  end
end
