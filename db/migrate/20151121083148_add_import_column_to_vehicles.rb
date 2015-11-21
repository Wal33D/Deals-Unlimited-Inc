class AddImportColumnToVehicles < ActiveRecord::Migration
  def change
    add_column :vehicles, :import, :string
  end
end
