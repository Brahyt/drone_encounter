class CreatePlayer < ActiveRecord::Migration[7.0]
  def change
    create_table :players do |t|
      t.references :team

      t.references :hero
      t.references :aspect

      t.timestamps
    end
  end
end
