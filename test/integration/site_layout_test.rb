require 'test_helper'

class SiteLayoutTest < ActionDispatch::IntegrationTest

  test "layout links" do
    get root_path
    assert_template '/'
    assert_select "a[href=?]", root_path
    assert_select "a[href=?]", privacy_path
    assert_select "a[href=?]", about_path
    assert_select "a[href=?]", contact_path
  end

  # test "the truth" do
  #   assert true
  # end
end
