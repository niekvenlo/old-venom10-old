require 'test_helper'

class UserTest < ActiveSupport::TestCase

  def setup
    @user = User.new(name: "Niek", email: "niek@gmail.com")
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'name should be present' do
    @user.name = "    "
    assert_not @user.valid?
  end

  test 'email should be present' do
    @user.email = "    "
    assert_not @user.valid?
  end

  test 'name must be at least 2' do
    @user.name = "a"
    assert_not @user.valid?
    @user.name = "aa"
    assert @user.valid?
  end

  test 'user name must include only letters with spaces and hypens' do
    assert @user.valid?
    @user.name = "1bob"
    assert_not @user.valid?
    @user.name = "bob button"
    assert @user.valid?
    @user.name = "bob-bin button"
    assert @user.valid?
    @user.name = "b o b  b u t t o n"
    assert @user.valid?
    @user.name = " bob"
    assert_not @user.valid?
    @user.name = "-bob"
    assert_not @user.valid?
    @user.name = "bob-"
    assert_not @user.valid?
    @user.name = "bob "
    assert_not @user.valid?
  end
end
