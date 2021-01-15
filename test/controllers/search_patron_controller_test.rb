require 'test_helper'

class SearchPatronControllerTest < ActionDispatch::IntegrationTest
  test "should get search" do
    get search_patron_search_url
    assert_response :success
  end

  test "should get results" do
    get search_patron_results_url
    assert_response :success
  end

end
