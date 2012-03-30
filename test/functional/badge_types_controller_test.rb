require 'test_helper'

class BadgeTypesControllerTest < ActionController::TestCase
  setup do
    @badge_type = badge_types(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:badge_types)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create badge_type" do
    assert_difference('BadgeType.count') do
      post :create, :badge_type => @badge_type.attributes
    end

    assert_redirected_to badge_type_path(assigns(:badge_type))
  end

  test "should show badge_type" do
    get :show, :id => @badge_type
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @badge_type
    assert_response :success
  end

  test "should update badge_type" do
    put :update, :id => @badge_type, :badge_type => @badge_type.attributes
    assert_redirected_to badge_type_path(assigns(:badge_type))
  end

  test "should destroy badge_type" do
    assert_difference('BadgeType.count', -1) do
      delete :destroy, :id => @badge_type
    end

    assert_redirected_to badge_types_path
  end
end
