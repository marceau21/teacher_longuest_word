class AddScoreToParty < ActiveRecord::Migration[6.0]
  def change
    add_column :parties, :score, :integer, default: 0, null: false
  end
end
