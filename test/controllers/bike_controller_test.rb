require "test_helper"

class BikeControllerTest < ActionDispatch::IntegrationTest
  test "should get get_bike_id" do
    get bike_get_bike_id_url
    assert_response :success
  end

  test "should get get_station_id" do
    get bike_get_station_id_url
    assert_response :success
  end

  test "should get get_station_name" do
    get bike_get_station_name_url
    assert_response :success
  end

  test "should get get_battery_percentage" do
    get bike_get_battery_percentage_url
    assert_response :success
  end
end
