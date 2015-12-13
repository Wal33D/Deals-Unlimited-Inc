class AddImageArrToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :vehicle_images, :jsonb
  end
end
