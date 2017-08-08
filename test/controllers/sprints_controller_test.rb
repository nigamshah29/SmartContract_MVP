require 'test_helper'

class SprintsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get sprints_create_url
    assert_response :success
  end

  test "should get sprint_requirements" do
    get sprints_sprint_requirements_url
    assert_response :success
  end

end
