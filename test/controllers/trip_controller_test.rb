require "test_helper"

class TripControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get trip_index_url
    assert_response :success
  end
end
