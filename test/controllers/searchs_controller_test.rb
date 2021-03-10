require 'test_helper'

class SearchsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get searchs_new_url
    assert_response :success
  end

end
