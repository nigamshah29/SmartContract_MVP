require 'test_helper'

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get request_payment" do
    get payments_request_payment_url
    assert_response :success
  end

  test "should get receive_payment" do
    get payments_receive_payment_url
    assert_response :success
  end

end
