require 'test_helper'

class CreditAppLockersControllerTest < ActionController::TestCase
  setup do
    @credit_app_locker = credit_app_lockers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:credit_app_lockers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create credit_app_locker" do
    assert_difference('CreditAppLocker.count') do
      post :create, credit_app_locker: { name: @credit_app_locker.name }
    end

    assert_redirected_to credit_app_locker_path(assigns(:credit_app_locker))
  end

  test "should show credit_app_locker" do
    get :show, id: @credit_app_locker
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @credit_app_locker
    assert_response :success
  end

  test "should update credit_app_locker" do
    patch :update, id: @credit_app_locker, credit_app_locker: { name: @credit_app_locker.name }
    assert_redirected_to credit_app_locker_path(assigns(:credit_app_locker))
  end

  test "should destroy credit_app_locker" do
    assert_difference('CreditAppLocker.count', -1) do
      delete :destroy, id: @credit_app_locker
    end

    assert_redirected_to credit_app_lockers_path
  end
end
