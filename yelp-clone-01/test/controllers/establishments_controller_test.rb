require 'test_helper'

class EstablishmentsControllerTest < ActionController::TestCase
  setup do
    @establishment = establishments(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:establishments)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create establishment" do
    assert_difference('Establishment.count') do
      post :create, establishment: { avatar_url: @establishment.avatar_url, city: @establishment.city, description: @establishment.description, name: @establishment.name, phone: @establishment.phone, postal_code: @establishment.postal_code, province: @establishment.province, street_address: @establishment.street_address, website: @establishment.website }
    end

    assert_redirected_to establishment_path(assigns(:establishment))
  end

  test "should show establishment" do
    get :show, id: @establishment
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @establishment
    assert_response :success
  end

  test "should update establishment" do
    patch :update, id: @establishment, establishment: { avatar_url: @establishment.avatar_url, city: @establishment.city, description: @establishment.description, name: @establishment.name, phone: @establishment.phone, postal_code: @establishment.postal_code, province: @establishment.province, street_address: @establishment.street_address, website: @establishment.website }
    assert_redirected_to establishment_path(assigns(:establishment))
  end

  test "should destroy establishment" do
    assert_difference('Establishment.count', -1) do
      delete :destroy, id: @establishment
    end

    assert_redirected_to establishments_path
  end
end
