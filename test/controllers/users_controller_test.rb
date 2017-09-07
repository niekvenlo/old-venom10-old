require 'test_helper'

class UsersControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get user_url(User.all.sample)
    assert_response :success
  end

  test "should get edit" do
    get edit_user_url(User.all.sample)
    assert_response :success
  end

end
