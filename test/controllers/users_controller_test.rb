require "test_helper"

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get verify_account" do
    get users_verify_account_url
    assert_response :success
  end

  test "should get delete_account" do
    get users_delete_account_url
    assert_response :success
  end
end
