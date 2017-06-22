require 'test_helper'

class CatsRentalControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get cats_rental_create_url
    assert_response :success
  end

  test "should get edit" do
    get cats_rental_edit_url
    assert_response :success
  end

  test "should get index" do
    get cats_rental_index_url
    assert_response :success
  end

  test "should get show" do
    get cats_rental_show_url
    assert_response :success
  end

  test "should get new" do
    get cats_rental_new_url
    assert_response :success
  end

  test "should get update" do
    get cats_rental_update_url
    assert_response :success
  end

end
