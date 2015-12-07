class AddPositionToMeets < ActiveRecord::Migration
  def change
    add_column :meets, :position, :string
  end
end
