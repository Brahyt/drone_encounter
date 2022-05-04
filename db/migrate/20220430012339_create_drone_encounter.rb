class CreateDroneEncounter < ActiveRecord::Migration[7.0]
  def change
    create_table :drone_encounters do |t|
      t.timestamps
      t.integer :drone_kills
      t.boolean :win
      t.text :notes
    end
  end
end
