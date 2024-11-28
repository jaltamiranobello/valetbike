require "test_helper"

class PaymentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get payments_new_url
    assert_response :success
  end

<<<<<<< HEAD
  test "should get create" do
    get payments_create_url
=======
  test "should get edit" do
    get payments_edit_url
>>>>>>> ca346d1 (created payments controller, new and edit placeholder views, and edited routes file)
    assert_response :success
  end
end
