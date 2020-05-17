require 'test_helper'

class LobsterControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get lobster_index_url
    assert_response :success
  end

end
