class ChangeAvailableToFalseByDefault < ActiveRecord::Migration[6.0]
  def change
    change_column :parties, :available, :boolean, default: false
  end
end
