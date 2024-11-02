require "test_helper"

class DirectorsControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get directors_login_url
    assert_response :success
  end

  test "should get register" do
    get directors_register_url
    assert_response :success
  end

  test "should get verify_email" do
    get directors_verify_email_url
    assert_response :success
  end
end
