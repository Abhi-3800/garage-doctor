class AddCarPriceToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :car_price, :float
  end
end
