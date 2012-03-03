require 'test_helper'

class JsControllerTest < ActionController::TestCase
  test "should get script1" do
    get :script1
    assert_response :success
  end

  test "should get script2" do
    get :script2
    assert_response :success
  end

end
