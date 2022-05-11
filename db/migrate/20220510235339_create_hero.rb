class CreateHero < ActiveRecord::Migration[7.0]
  def change
    create_table :heros do |t|
      t.string :name
      t.integer :version

      t.timestamps
    end
  end
end
