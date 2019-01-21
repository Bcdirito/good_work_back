require 'test_helper'

class PracticeControllerTest < ActionDispatch::IntegrationTest
  test "should get name" do
    get practice_name_url
    assert_response :success
  end

  test "should get address" do
    get practice_address_url
    assert_response :success
  end

  test "should get phone" do
    get practice_phone_url
    assert_response :success
  end

end
