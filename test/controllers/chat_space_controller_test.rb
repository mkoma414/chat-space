require 'test_helper'

class ChatSpaceControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get chat_space_index_url
    assert_response :success
  end

end
