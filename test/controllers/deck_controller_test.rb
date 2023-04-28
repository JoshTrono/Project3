require "test_helper"

class DeckControllerTest < ActionDispatch::IntegrationTest


  test "should get index" do
    user = users(:one)
    post session_logged_in_url, params: { email: user.email, password: user.password }
    get deck_index_url
    assert_response :success
  end

  test "should create a deck" do
    user = users(:one)
    post session_logged_in_url, params: { email: user.email, password: user.password }
    post deck_create_url, params: { name: 'test', description: 'test', user_id: user.id }
    assert_response :success
  end

  # test "should get all" do
  #   get deck_all_url
  #   assert_response :success
  # end
  #
  # test "should get where" do
  #   get deck_where_url
  #   assert_response :success
  # end
  #
  # test "should get destroy" do
  #   get deck_destroy_url
  #   assert_response :success
  # end
  #
  # test "should get update" do
  #   get deck_update_url
  #   assert_response :success
  # end
end
