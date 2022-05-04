class CreatePlayer < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.timestamps

      t.references :drone_encounter
      t.string :player_name
      t.string :hero
      t.string :hero_aspect
      t.string :notes
    end
  end
end
