require "test_helper"

class Admin::StatisticsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_statistics_index_url
    assert_response :success
  end
end
