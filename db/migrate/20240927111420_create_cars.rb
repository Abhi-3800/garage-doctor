class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :mfg_company
      t.string :car_model
      t.date :mfg_year
      t.text :car_description
      t.float :horse_power
      t.float :top_speed

      t.timestamps
    end
  end
end
