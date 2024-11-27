require "test_helper"

class StationsMapControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get stations_map_index_url
    assert_response :success
  end
end
