require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest

  def setup
    # session[:id] = 1
  end

  test "should get show" do
    get group_url(Group.all.sample)
    assert_response 404
  end

  test "should get edit" do
    get edit_group_url(Group.all.sample)
    assert_response :success
  end

  test "should get new" do
    get new_group_url
    assert_response :success
  end

end
