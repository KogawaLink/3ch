require 'test_helper'

class NewthreadsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get newthreads_new_url
    assert_response :success
  end

end
