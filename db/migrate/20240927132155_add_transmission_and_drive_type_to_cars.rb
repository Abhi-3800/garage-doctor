class AddTransmissionAndDriveTypeToCars < ActiveRecord::Migration[7.0]
  def change
    add_column :cars, :transmission, :integer, default: 0
    add_column :cars, :drive_type, :integer, default: 0
  end
end
