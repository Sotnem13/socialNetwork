require 'test_helper'

class PagesControllerTest < ActionController::TestCase
  test "should get index" do
    get :index
    assert_response :success
  end

  test "should get friends" do
    get :friends
    assert_response :success
  end

  test "should get messages" do
    get :messages
    assert_response :success
  end

  test "should get photos" do
    get :photos
    assert_response :success
  end

  test "should get settings" do
    get :settings
    assert_response :success
  end

end
