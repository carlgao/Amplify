require 'test_helper'

class WordsControllerTest < ActionController::TestCase
  test "should get get_word" do
    get :get_word
    assert_response :success
  end

end
