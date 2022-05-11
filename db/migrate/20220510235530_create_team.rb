class CreateTeam < ActiveRecord::Migration[7.0]
  def change
    create_table :teams do |t|
      t.string :name
      t.string :identifier

      t.timestamps
    end
  end
end
