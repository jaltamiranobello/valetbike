require "test_helper"

class CardControllerTest < ActionDispatch::IntegrationTest
  test "should get remove_card" do
    get card_remove_card_url
    assert_response :success
  end

  test "should get update_payment" do
    get card_update_payment_url
    assert_response :success
  end

  test "should get verify_payment" do
    get card_verify_payment_url
    assert_response :success
  end

  test "should get pay" do
    get card_pay_url
    assert_response :success
  end
end
