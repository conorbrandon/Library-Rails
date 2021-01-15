require 'test_helper'

class SearchResControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get search_res_search_url
    assert_response :success
  end

end
