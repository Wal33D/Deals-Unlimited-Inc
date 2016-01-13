class AddCountclicksToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :countclicks, :integer
  end
end
