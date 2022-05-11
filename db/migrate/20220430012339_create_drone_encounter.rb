class CreateDroneEncounter < ActiveRecord::Migration[7.0]
  def change
    create_enum :game_status, %w[win lose in_progress]

    create_table :drone_encounters do |t|
      t.integer :drone_kills
      t.integer :round_number
      t.references :team
      t.enum :current_status, enum_type: 'game_status', default: 'in_progress', null: false

      t.timestamps
    end
  end
end
