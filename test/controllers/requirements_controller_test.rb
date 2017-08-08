require 'test_helper'

class RequirementsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get requirements_create_url
    assert_response :success
  end

  test "should get sprint_requirements" do
    get requirements_sprint_requirements_url
    assert_response :success
  end

end
