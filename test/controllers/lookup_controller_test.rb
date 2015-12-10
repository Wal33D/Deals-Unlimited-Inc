require 'test_helper'

class LookupControllerTest < ActionController::TestCase
  test "should get vin" do
    get :vin
    assert_response :success
  end

end
