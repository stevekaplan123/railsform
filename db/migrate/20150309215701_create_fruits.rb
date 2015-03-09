class CreateFruits < ActiveRecord::Migration
  def change
    create_table :fruits do |t|
      t.string :species
      t.boolean :organic

      t.timestamps null: false
    end
  end
end
