class AddPositionToMeets < ActiveRecord::Migration
  def change
    add_column :meets, :position, :string
        add_column :meets, :headshot_images, :jsonb

  end
end

