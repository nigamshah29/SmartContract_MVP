require 'test_helper'

class ClientsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get clients_index_url
    assert_response :success
  end

  test "should get login" do
    get clients_login_url
    assert_response :success
  end

  test "should get register" do
    get clients_register_url
    assert_response :success
  end

  test "should get logout" do
    get clients_logout_url
    assert_response :success
  end

end
