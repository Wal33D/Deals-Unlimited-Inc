require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get welcome" do
    get :welcome
    assert_response :success
  end

  test "should get finance" do
    get :finance
    assert_response :success
  end

  test "should get directions" do
    get :directions
    assert_response :success
  end

  test "should get policy" do
    get :policy
    assert_response :success
  end

end
