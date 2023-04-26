require 'test_helper'

class SessionControllerTest < ActionDispatch::IntegrationTest
  # test "should get create" do
  #   get session_create_url
  #   assert_response :success
  # end
  #
  # test "should get destroy" do
  #   get session_destroy_url
  #   assert_response :success
  # end

  test 'should log in' do
    user = users(:one)
    post session_logged_in_url, params: { email: user.email, password: user.password }
    assert_response :success
  end
  test "should fail to log in with invalid password" do
    user = users(:one)
    post session_logged_in_url, params: { email: user.email, password: '' }
    assert_response :unauthorized
  end
  test "should fail to log in with invalid email" do
    user = users(:one)
    post session_logged_in_url, params: { email: "invalid", password: user.password }
    assert_response :unauthorized
  end
  test "should fail to log in with invalid email and password" do
    user = users(:one)
    post session_logged_in_url, params: { email: "invalid", password: 'invalid' }
    assert_response :unauthorized
  end
end
