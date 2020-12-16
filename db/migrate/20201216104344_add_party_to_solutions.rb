class AddPartyToSolutions < ActiveRecord::Migration[6.0]
  def change
    add_reference :solutions, :party, null: false, foreign_key: true
  end
end
