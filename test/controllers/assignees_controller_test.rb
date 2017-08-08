require 'test_helper'

class AssigneesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get assignees_index_url
    assert_response :success
  end

  test "should get login" do
    get assignees_login_url
    assert_response :success
  end

  test "should get register" do
    get assignees_register_url
    assert_response :success
  end

  test "should get logout" do
    get assignees_logout_url
    assert_response :success
  end

end
