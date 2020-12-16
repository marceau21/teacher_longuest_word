class ChangeTenLetterListNameFromParty < ActiveRecord::Migration[6.0]
  def change
    rename_column :parties, :ten_letter_list, :ten_letters_list
  end
end
