class CreateMatchRecords < ActiveRecord::Migration[8.1]
  def change
    create_table :match_records do |t|
      t.date :played_on, null: false
      t.string :tournament_name
      t.string :opponent_name
      t.references :my_deck, null: false, foreign_key: { to_table: :decks }
      t.references :opponent_deck, null: false, foreign_key: { to_table: :decks }
      t.string :rock_paper_scissors_result, null: false
      t.string :turn_order, null: false
      t.string :result, null: false
      t.string :environment
      t.boolean :include_in_aggregation, null: false, default: true
      t.text :memo

      t.timestamps
    end
    add_index :match_records, :played_on
  end
end
