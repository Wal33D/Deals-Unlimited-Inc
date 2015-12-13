class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :import
      t.string :kind
      t.string :status
      t.string :model
      t.string :title
      t.integer :price
      t.string :make
      t.integer :year
      t.string :body_style
      t.integer :mileage
      t.string :exterior_color
      t.string :interior_color
      t.string :engine
      t.string :transmission
      t.string :drive_type
      t.string :vehicle_class
      t.string :mpg
      t.string :trim
      t.string :fuel_type
      t.string :stereo
      t.integer :doors
      t.string :stock_number
      t.string :vin_num
      t.string :thumb
      t.string :description
      t.string :other_options
      t.string :image_1
      t.string :image_2
      t.string :image_3
      t.string :image_4
      t.string :image_5
      t.string :image_6
      t.string :image_6
      t.string :image_7
      t.string :image_8
      t.string :image_9
      t.string :image_10
      t.string :image_11
      t.string :image_12
      t.string :image_13
      t.string :image_14
      t.string :image_15
      t.string :image_16
      t.string :image_17
      t.string :image_18
      t.string :image_19
      t.string :image_20
      t.string :image_21
      t.string :image_22
      t.string :image_23
      t.string :image_24

      t.timestamps null: false
    end
  end
end
