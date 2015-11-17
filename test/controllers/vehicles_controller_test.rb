require 'test_helper'

class VehiclesControllerTest < ActionController::TestCase
  setup do
    @vehicle = vehicles(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:vehicles)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create vehicle" do
    assert_difference('Vehicle.count') do
      post :create, vehicle: { body_style: @vehicle.body_style, description: @vehicle.description, doors: @vehicle.doors, drive_type: @vehicle.drive_type, engine: @vehicle.engine, exterior_color: @vehicle.exterior_color, fuel_type: @vehicle.fuel_type, image_10: @vehicle.image_10, image_11: @vehicle.image_11, image_12: @vehicle.image_12, image_13: @vehicle.image_13, image_14: @vehicle.image_14, image_15: @vehicle.image_15, image_16: @vehicle.image_16, image_17: @vehicle.image_17, image_18: @vehicle.image_18, image_19: @vehicle.image_19, image_1: @vehicle.image_1, image_20: @vehicle.image_20, image_21: @vehicle.image_21, image_22: @vehicle.image_22, image_23: @vehicle.image_23, image_24: @vehicle.image_24, image_2: @vehicle.image_2, image_3: @vehicle.image_3, image_4: @vehicle.image_4, image_5: @vehicle.image_5, image_6: @vehicle.image_6, image_6: @vehicle.image_6, image_7: @vehicle.image_7, image_8: @vehicle.image_8, image_9: @vehicle.image_9, interior_color: @vehicle.interior_color, kind: @vehicle.kind, make: @vehicle.make, mileage: @vehicle.mileage, model: @vehicle.model, mpg: @vehicle.mpg, other_options: @vehicle.other_options, price: @vehicle.price, status: @vehicle.status, stereo: @vehicle.stereo, stock_number: @vehicle.stock_number, thumb: @vehicle.thumb, title: @vehicle.title, transmission: @vehicle.transmission, trim: @vehicle.trim, vehicle_class: @vehicle.vehicle_class, vin_num: @vehicle.vin_num, year: @vehicle.year }
    end

    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should show vehicle" do
    get :show, id: @vehicle
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @vehicle
    assert_response :success
  end

  test "should update vehicle" do
    patch :update, id: @vehicle, vehicle: { body_style: @vehicle.body_style, description: @vehicle.description, doors: @vehicle.doors, drive_type: @vehicle.drive_type, engine: @vehicle.engine, exterior_color: @vehicle.exterior_color, fuel_type: @vehicle.fuel_type, image_10: @vehicle.image_10, image_11: @vehicle.image_11, image_12: @vehicle.image_12, image_13: @vehicle.image_13, image_14: @vehicle.image_14, image_15: @vehicle.image_15, image_16: @vehicle.image_16, image_17: @vehicle.image_17, image_18: @vehicle.image_18, image_19: @vehicle.image_19, image_1: @vehicle.image_1, image_20: @vehicle.image_20, image_21: @vehicle.image_21, image_22: @vehicle.image_22, image_23: @vehicle.image_23, image_24: @vehicle.image_24, image_2: @vehicle.image_2, image_3: @vehicle.image_3, image_4: @vehicle.image_4, image_5: @vehicle.image_5, image_6: @vehicle.image_6, image_6: @vehicle.image_6, image_7: @vehicle.image_7, image_8: @vehicle.image_8, image_9: @vehicle.image_9, interior_color: @vehicle.interior_color, kind: @vehicle.kind, make: @vehicle.make, mileage: @vehicle.mileage, model: @vehicle.model, mpg: @vehicle.mpg, other_options: @vehicle.other_options, price: @vehicle.price, status: @vehicle.status, stereo: @vehicle.stereo, stock_number: @vehicle.stock_number, thumb: @vehicle.thumb, title: @vehicle.title, transmission: @vehicle.transmission, trim: @vehicle.trim, vehicle_class: @vehicle.vehicle_class, vin_num: @vehicle.vin_num, year: @vehicle.year }
    assert_redirected_to vehicle_path(assigns(:vehicle))
  end

  test "should destroy vehicle" do
    assert_difference('Vehicle.count', -1) do
      delete :destroy, id: @vehicle
    end

    assert_redirected_to vehicles_path
  end
end
