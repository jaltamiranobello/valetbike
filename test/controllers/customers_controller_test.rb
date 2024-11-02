require "test_helper"

class CustomersControllerTest < ActionDispatch::IntegrationTest
  test "should get update_profile" do
    get customers_update_profile_url
    assert_response :success
  end

  test "should get start_trip" do
    get customers_start_trip_url
    assert_response :success
  end

  test "should get end_trip" do
    get customers_end_trip_url
    assert_response :success
  end

  test "should get past_trip_calculations" do
    get customers_past_trip_calculations_url
    assert_response :success
  end
end
