require 'test_helper'

class GroupsControllerTest < ActionDispatch::IntegrationTest

  test "should not show groups for logged out users" do
    get group_url(Group.all.sample)
    assert_response 302
  end

  test "should get edit" do
    get edit_group_url(Group.all.sample)
    assert_response :ok
  end

  test "should get new" do
    get new_group_url
    assert_response :ok
  end

end
