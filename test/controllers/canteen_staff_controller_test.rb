require 'test_helper'

class CanteenStaffControllerTest < ActionDispatch::IntegrationTest
  test "should get dashboard" do
    get canteen_staff_dashboard_url
    assert_response :success
  end

end
