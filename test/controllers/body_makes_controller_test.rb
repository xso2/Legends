require 'test_helper'

class BodyMakesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get body_makes_index_url
    assert_response :success
  end

  test "should get new" do
    get body_makes_new_url
    assert_response :success
  end

  test "should get create" do
    get body_makes_create_url
    assert_response :success
  end

  test "should get show" do
    get body_makes_show_url
    assert_response :success
  end

  test "should get edit" do
    get body_makes_edit_url
    assert_response :success
  end

  test "should get update" do
    get body_makes_update_url
    assert_response :success
  end

  test "should get destroy" do
    get body_makes_destroy_url
    assert_response :success
  end

end
