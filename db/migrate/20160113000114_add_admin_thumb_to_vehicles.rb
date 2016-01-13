class AddAdminThumbToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :admin_thumb, :string
  end
end
