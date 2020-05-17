require 'test_helper'

class BanControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ban_index_url
    assert_response :success
  end

end
