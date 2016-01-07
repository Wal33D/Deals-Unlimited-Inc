require 'test_helper'

class ContactStoresControllerTest < ActionController::TestCase
  setup do
    @contact_store = contact_stores(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:contact_stores)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create contact_store" do
    assert_difference('ContactStore.count') do
      post :create, contact_store: { date_time: @contact_store.date_time, email: @contact_store.email, message: @contact_store.message, name: @contact_store.name, tel: @contact_store.tel }
    end

    assert_redirected_to contact_store_path(assigns(:contact_store))
  end

  test "should show contact_store" do
    get :show, id: @contact_store
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @contact_store
    assert_response :success
  end

  test "should update contact_store" do
    patch :update, id: @contact_store, contact_store: { date_time: @contact_store.date_time, email: @contact_store.email, message: @contact_store.message, name: @contact_store.name, tel: @contact_store.tel }
    assert_redirected_to contact_store_path(assigns(:contact_store))
  end

  test "should destroy contact_store" do
    assert_difference('ContactStore.count', -1) do
      delete :destroy, id: @contact_store
    end

    assert_redirected_to contact_stores_path
  end
end
