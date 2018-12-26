require "test_helper"

class ExcercisesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get excercises_index_url
    assert_response :success
  end

  test "should get show" do
    get excercises_show_url
    assert_response :success
  end
end
