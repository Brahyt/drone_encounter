class ChangeDefaultValueOnDroneCounter < ActiveRecord::Migration[7.0]
  def change
    change_column :drone_encounters, :drone_kills, :integer, default: 0
    change_column :drone_encounters, :round_number, :integer, default: 0
  end
end
