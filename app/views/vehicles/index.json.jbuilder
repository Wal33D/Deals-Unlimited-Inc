json.array!(@vehicles) do |vehicle|
  json.extract! vehicle, :id, :kind, :status, :model, :title, :price, :make, :year, :body_style, :mileage, :exterior_color, :interior_color, :engine, :transmission, :drive_type, :vehicle_class, :mpg, :trim, :fuel_type, :stereo, :doors, :stock_number, :vin_num, :thumb, :description, :other_options, :image_1, :image_2, :image_3, :image_4, :image_5, :image_6, :image_6, :image_7, :image_8, :image_9, :image_10, :image_11, :image_12, :image_13, :image_14, :image_15, :image_16, :image_17, :image_18, :image_19, :image_20, :image_21, :image_22, :image_23, :image_24
  json.url vehicle_url(vehicle, format: :json)
end
